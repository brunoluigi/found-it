module ApplicationHelper
  # Returns the current ItemView for the session and IP for a given item
  def current_item_view_for(item)
    @item_view || begin
      anon_user_hash = session[:anon_user_hash]
      ip_address = request.remote_ip
      ItemView.find_by(item: item, ip_address: ip_address, anon_user_hash: anon_user_hash)
    end
  end

  # Renders the found_it_form turbo frame partial
  def found_it_form_path(item_view)
    return "" unless item_view
    render RubyUI::FoundItForm.new(item_view: item_view)
  end
end
