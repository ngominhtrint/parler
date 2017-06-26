class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.string :subject
      t.references :conversation, foreign_key: true
      t.datetime :read_at

      t.timestamps
    end
  end
end
