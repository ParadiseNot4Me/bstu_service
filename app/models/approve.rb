class Approve < ActiveRecord::Base
  belongs_to :user
  belongs_to :steward
end
