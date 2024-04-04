class AddImageToAmiibos < ActiveRecord::Migration[7.1]
  def change
    add_column :amiibos, :image, :string
  end
end
