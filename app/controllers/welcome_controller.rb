class WelcomeController < ApplicationController
  def index
    @welcome = UserWelcome.new(current_user)
    render 'welcome/user'
  end
end
