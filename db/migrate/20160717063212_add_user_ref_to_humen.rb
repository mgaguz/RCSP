class AddUserRefToHumen < ActiveRecord::Migration
  def change
    add_reference :humen, :user, index: true, foreign_key: true
  end
end
