class AfterSale < ApplicationRecord
  belongs_to  :user
  belongs_to  :item
  has_one     :send_address
end
