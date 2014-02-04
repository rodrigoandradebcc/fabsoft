class AddColumnImageToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :image, :string
  end
end
