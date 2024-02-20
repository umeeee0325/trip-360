class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.integer :residence_id, null: false
      t.text :title, null: false
      t.text :text, null: false
      t.string :city
      t.string :spot
      t.date :shooting_day
      t.timestamps
    end
  end
end
