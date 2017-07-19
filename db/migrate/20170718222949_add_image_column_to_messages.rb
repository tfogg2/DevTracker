class AddImageColumnToMessages < ActiveRecord::Migration[5.1]
  def change
    add_attachment :messages, :image
  end
end
