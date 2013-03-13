class AddEventTypeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :eventtype, :string
  end
end
