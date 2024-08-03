class AddAdditionalDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.text   :address
      t.date   :date_of_birth
    end
  end
end
