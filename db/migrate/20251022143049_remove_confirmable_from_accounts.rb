# db/migrate/XXXXXX_remove_confirmable_from_accounts.rb
class RemoveConfirmableFromAccounts < ActiveRecord::Migration[7.1]
  def change
    remove_column :accounts, :confirmation_token, :string
    remove_column :accounts, :confirmed_at, :datetime
    remove_column :accounts, :confirmation_sent_at, :datetime
    remove_column :accounts, :unconfirmed_email, :string
  end
end
