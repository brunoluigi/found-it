class ItemViewsController < ApplicationController
  allow_unauthenticated_access only: [ :show, :update ]

  def show
    @item = Item.find_by(id: params[:id])

    unless @item
      render RubyUI::ItemNotFoundPage.new(item_id: params[:id]), status: :not_found and return
    end

    session[:anon_user_hash] ||= SecureRandom.hex(16)
    anon_user_hash = session[:anon_user_hash]
    ip_address = request.remote_ip
    @item_view = ItemView.find_or_create_by(item: @item, ip_address: ip_address, anon_user_hash: anon_user_hash)
    @item_view.touch if @item_view.persisted?

    render RubyUI::PublicItemInfoPage.new(item: @item)
  end

  def update
    @item_view = ItemView.find(params[:id])
    if @item_view.update(found_it_message: params[:item_view][:found_it_message], found_it_at: Time.current)
      redirect_to item_view_path(item_id: @item_view.item.id), notice: "Thank you for your help!"
    else
      render partial: "ruby_ui/found_it_form", locals: { item_view: @item_view }, status: :unprocessable_entity
    end
  end
end
