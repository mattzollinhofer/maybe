class UserWelcome
  attr_reader :user

  def initialize(user)
    @user = user
    @availability = Availability.new(user: user)
  end

  def display_name
    @user.name
  end

  def availability_message
    if @availability.available?
      "You're available for the next #{@availability.available_for} minutes"
    else
      "You're not available"
    end
  end

  def available_friends
    User.friends_available_for_calls(@user)
  end

  def availability
    @availability.available? ? 'available' : 'unavailable'
  end
end
