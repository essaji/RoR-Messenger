class ChatController < ApplicationController
  def showlist
    @userslist = User.all
  end
end