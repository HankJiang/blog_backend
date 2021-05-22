class InitDb < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end

    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :view_count, default: 0
      t.string :title
      t.text :content
      t.boolean :is_publish
      t.date :publish_date

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
