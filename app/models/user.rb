class User < ActiveRecord::Base
  has_many :hashs, dependent: :destroy
  belongs_to :student

  before_create :hash_password

    def hash_password
      self.password = Digest::MD5.hexdigest(self.password)
    end

end
