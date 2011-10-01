class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.integer :uid
      t.string :screen_name
      t.string :access_token
      t.string :access_secret
      t.trackable
      t.timestamps

      # t.database_authenticatable :null => false
      # t.recoverable
      # t.rememberable
      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
    end

    add_index :users, :uid,                 :unique => true
    add_index :users, :screen_name,         :unique => true
    # add_index :users, :email,                :unique => true
    # add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
