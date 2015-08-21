class CreateSections < ActiveRecord::Migration
  def up
    create_table :documents do |t|
      t.string :title
      t.timestamps null: false
    end

    create_table :sections do |t|
      t.integer :document_id
      t.string :title
      t.timestamps null: false
    end

  end

  def down
    drop_table :sections
    drop_table :documents
  end
end
