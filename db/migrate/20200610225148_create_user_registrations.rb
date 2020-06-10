class CreateUserRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_registrations do |t|
      t.string :email, null: false
      t.string :token, null: false
      t.references :user, foreign_key: true
      t.datetime :expired_at, null: false

      t.timestamps
    end
  end
end
