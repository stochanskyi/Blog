require 'bcrypt'
class User < ApplicationRecord
  include BCrypt

  def decoded_password
    @password ||= Password.new(password)
  end

  def decoded_password=(new_password)
    @password = Password.create(new_password)
    self.password = @password
  end
end
