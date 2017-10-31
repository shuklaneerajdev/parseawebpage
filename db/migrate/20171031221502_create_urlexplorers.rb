class CreateUrlexplorers < ActiveRecord::Migration[5.0]
  def change
    create_table :urlexplorers do |t|
      t.text :url
      t.text :content
      t.jsonb :parsed_headers
      t.boolean :is_parsing_done

      t.timestamps
    end
  end
end
