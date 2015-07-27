class CreateSummaries < ActiveRecord::Migration
  def change

    create_table :summaries do |t|
      t.text :description
      t.references :post_id, index:true, foreign_key:true
      t.timestamps
    end
  end
end
