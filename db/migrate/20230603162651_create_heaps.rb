class CreateHeaps < ActiveRecord::Migration[7.0]
  def change
    create_table :heaps do |t|

      t.timestamps
    end
  end
end
