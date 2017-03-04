class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text  :body
      t.references :conversations, index: true
      t.references :user, index:true
      t.boolean :read, :default => false

      t.integer :conversation_id
      t.integer :user_id
    end
  end
end
