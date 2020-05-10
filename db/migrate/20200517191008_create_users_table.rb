class CreateUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false
      t.string :display_name, null: false
      t.string :password_digest

      t.timestamps

      t.index   :email, unique: true
    end
  end
end
