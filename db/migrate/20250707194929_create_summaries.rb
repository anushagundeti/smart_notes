class CreateSummaries < ActiveRecord::Migration[8.0]
  def change
    create_table :summaries do |t|
      t.string :title
      t.text :original_text
      t.text :summary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
