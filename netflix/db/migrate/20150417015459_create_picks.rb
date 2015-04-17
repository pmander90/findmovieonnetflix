class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
    	t.string :past
    	t.belongs_to :user
      t.timestamps null: false
    end
  end
end
