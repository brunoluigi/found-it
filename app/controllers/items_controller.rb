class ItemsController < ApplicationController
  before_action :set_item, only: [ :show, :edit, :update, :destroy ]

  def index
    items = Current.user.items.order(created_at: :desc)

    render RubyUI::ItemsIndexPage.new(items:)
  end

  def show
    render RubyUI::ShowItemPage.new(item: @item)
  end

  def new
    @item = Current.user.items.build
    render RubyUI::NewItemPage.new(item: @item)
  end

  def create
    @item = Current.user.items.build(item_params)
    if @item.save
      redirect_to @item, notice: "Item was successfully created."
    else
      render RubyUI::NewItemPage.new(item: @item), status: :unprocessable_entity
    end
  end

  def edit
    render RubyUI::EditItemPage.new(item: @item)
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: "Item was successfully updated."
    else
      render RubyUI::EditItemPage.new(item: @item), status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "Item was successfully deleted."
  end

  private
    def set_item
      @item = Current.user.items.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:content)
    end
end
