class Pokemon < ActiveRecord::Base
  belongs_to :user

  validates :species, presence: true
  self.table_name = "pokemon"
end
