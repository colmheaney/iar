class AddImageToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :image, :string
  end
end
