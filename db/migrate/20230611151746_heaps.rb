class Heaps < ActiveRecord::Migration[7.0]
  def change
    create_table :heaps do |t|
      t.string :accepted_indices
      t.string :waitlisted_indices
      t.string :rejected_indices

      t.timestamps
  end
  end
end
