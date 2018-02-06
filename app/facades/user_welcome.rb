class UserWelcome
  attr_reader :user, :availability

  def initialize(user)
    @user = user
    @availability = Availability.new(user: user, available: true)
  end

  def display_name
    @user.name
  end

  def available_friends
    User.friends_available_for_calls(@user)
  end

  def availability
    @availability.status
  end
end
