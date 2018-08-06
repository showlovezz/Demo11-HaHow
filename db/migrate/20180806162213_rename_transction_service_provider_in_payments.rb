class RenameTransctionServiceProviderInPayments < ActiveRecord::Migration[5.2]
  def change
  	rename_column :payments, :transction_service_provider, :transaction_service_provider
  end
end
