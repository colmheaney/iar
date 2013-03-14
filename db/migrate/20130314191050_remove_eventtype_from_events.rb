class RemoveEventtypeFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :eventtype
  end

  def down
    add_column :events, :eventtype, :string
  end
end
