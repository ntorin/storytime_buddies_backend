class CreateGraduates < ActiveRecord::Migration[5.0]
  def change
    create_table :graduates do |t|
      t.string :first_name
      t.string :last_name
      t.string :cohort
      t.string :current_job
      t.text :bio
      t.string :website
      t.text :picture

      t.timestamps
    end
  end
end
