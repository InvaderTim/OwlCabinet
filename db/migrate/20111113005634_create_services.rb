class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :user_image

      t.timestamps
    end

    add_column :users, :service_id, :integer
    add_index :users, :service_id
  end
end
