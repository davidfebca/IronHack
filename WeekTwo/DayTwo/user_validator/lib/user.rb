require 'io/console'
require 'yaml/store'
class User
  attr_accessor :id,:username,:password,:loged
  def initialize id, username, password
    @id = id
    @username = username
    @password = password
    @loged = false
  end
  def login
    @loged = true
  end
  def loged
    @loged
  end
end
