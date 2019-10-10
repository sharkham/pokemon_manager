class Pokemon < ActiveRecord::Base
  belongs_to :user
  belongs_to :species

  # validates :nic, presence: true
  # self.table_name = "pokemon"
end
