class AddNewsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :news, :integer
  end
end
