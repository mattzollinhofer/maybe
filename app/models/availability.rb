class Availability
  attr_accessor :user

  def initialize(user: )#, available_at: Time.current,  available_for: 30)
    @user = (user.is_a?(User)) ? user : User.find(user)
  end

  def available?
    return false if unavailable_at.blank?
    unavailable_at > Time.current
  end

  def unavailable?
    !available?
  end

  def available_for
    (@user.unavailable_at - Time.current).to_i / 60
  end

  def unavailable_at
    @user.unavailable_at
  end
end
