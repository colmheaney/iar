class AddPubtypeToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :pubtype, :string
  end
end
