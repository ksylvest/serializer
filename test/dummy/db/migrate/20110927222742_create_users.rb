class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :account, :index => true
      t.string :name
      t.string :email
      t.text :settings

      t.timestamps
    end
  end
end
