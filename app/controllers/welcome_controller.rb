class WelcomeController < ApplicationController
  def index
    @user = Current.user

    render RubyUI::WelcomePage.new(user: @user)
  end
end
