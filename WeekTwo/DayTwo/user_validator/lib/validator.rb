require 'io/console'
require 'yaml/store'
require 'tzinfo'
class Validator
  attr_accessor :users
  def initialize
    @users = []
  end
  def add_user user
      @users.push(user)
  end
  def find_user username
    result = @users.find {|user| user.username == username}
  end
end
