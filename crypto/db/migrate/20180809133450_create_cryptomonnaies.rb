class CreateCryptomonnaies < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptomonnaies do |t|
      t.string :name
      t.string :price

      t.timestamps
    end
  end
end
