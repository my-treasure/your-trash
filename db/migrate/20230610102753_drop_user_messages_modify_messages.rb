class DropUserMessagesModifyMessages < ActiveRecord::Migration[7.0]
  def change
    drop_table :usermessages
    add_reference :messages, :chatroom, foreign_key: true
  end
end
