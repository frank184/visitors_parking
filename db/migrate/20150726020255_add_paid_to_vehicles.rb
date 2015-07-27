class AddPaidToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :paid, :boolean, default: false
  end
end
