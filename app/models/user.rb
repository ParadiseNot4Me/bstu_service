class User < ActiveRecord::Base
  belongs_to :hashs

  before_create :hash_password

    def hash_password
      self.password = Digest::MD5.hexdigest(self.password)
    end
end
