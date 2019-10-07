class Pokemon < ActiveRecord::Base
  belongs_to :user

  # self.table_name = "pokemon"
end
