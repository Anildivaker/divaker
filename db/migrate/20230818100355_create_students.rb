class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :st_name

      t.timestamps
    end
  end
end
