class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :title
      t.text :content
      t.integer :user, index: true

      t.timestamps null: false
    end
  end
end
