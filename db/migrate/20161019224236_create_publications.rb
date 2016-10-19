class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.string :avatar

      t.timestamps
    end
  end
end
