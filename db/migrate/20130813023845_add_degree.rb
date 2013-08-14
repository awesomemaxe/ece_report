class AddDegree < ActiveRecord::Migration
  def change
  	add_column :report_cards, :degree , :string
  end
end
