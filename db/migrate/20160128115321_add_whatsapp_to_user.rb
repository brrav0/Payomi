class AddWhatsappToUser < ActiveRecord::Migration
  def change
    add_column :users, :whatsapp, :string
  end
end
