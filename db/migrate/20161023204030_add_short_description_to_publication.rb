class AddShortDescriptionToPublication < ActiveRecord::Migration[5.0]
  def change
  	add_column :publications, :short_description, :string
  end
end
