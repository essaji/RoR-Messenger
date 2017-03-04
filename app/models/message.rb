class Message < ApplicationRecord
  belongs_to :conversation, :foreign_key => :conversations_id, class_name: 'Conversation'
  belongs_to :user, :foreign_key => :user_id, class_name: 'User'
end