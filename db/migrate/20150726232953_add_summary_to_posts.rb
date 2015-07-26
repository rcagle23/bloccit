class AddSummaryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :summary_id, :integer
    add_index :posts, :summary_id
    
    create_table :summaries do |t|
      t.text :description

      t.timestamps
    end
  end
end
