class CreateUserRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_registrations do |t|
      t.string :email
      t.string :token
      t.references :user, null: false, foreign_key: true
      t.datetime :expired_at

      t.timestamps
    end
  end
end
