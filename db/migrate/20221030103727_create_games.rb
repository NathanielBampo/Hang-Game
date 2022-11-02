class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :choice_user
      t.string :choice_pk
      t.string :result

      t.timestamps null: false
    end
  end
end
