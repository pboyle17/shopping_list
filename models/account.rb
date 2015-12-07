class Account < ActiveRecord::Base

  has_many :lists
  
  include BCrypt

#setter
  def password=(pwd)
    self.password_digest=BCrypt::Password.create(pwd)
  end
#getter
  def password
    BCrypt::Password.new(self.password_digest)
  end


  def self.authenticate (user_name, password)
    current_user=Account.find_by(user_name: user_name)

    if current_user.password == password
      return current_user
    else
      return nil
    end
  end

end
