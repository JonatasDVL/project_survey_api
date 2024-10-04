class CreateResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :responses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :selected_option, foreign_key: { to_table: :options }
      t.text :text_response

      t.timestamps
    end
  end
end
