class Pokemon < ActiveRecord::Base
  belongs_to :user
  belongs_to :species

  validates :species, presence: true
  # self.table_name = "pokemon"
end
