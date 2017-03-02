class WelcomeController < ApplicationController

  def home
    @email = current_user.email;
  end
end