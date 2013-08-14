class CreateReportCards < ActiveRecord::Migration
  def change
    create_table :report_cards do |t|
      t.string :UID
      t.string :degree
      t.timestamps
    end
  end
end
