class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :pro_name

      t.timestamps
    end
  end
end
