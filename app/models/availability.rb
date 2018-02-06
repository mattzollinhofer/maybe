class Availability
  attr_accessor :user, :available, :available_for

  def initialize(user: , available: , available_at: Time.current,  available_for: 30)
    available_for ||= 30
    throw ArgumentError.new 'available_for needs to be a number' unless available_for.is_a?(Numeric)

    @user = (user.is_a?(User)) ? user : User.find(user)
    @available = available
    @available_at = available_at
    @available_for = available_for.to_i || 30
  end

  def status
    available? ? 'available' : 'unavailable'
  end

  def update
    @user.available = @available
    @user.unavailable_at = determine_unavailable_at_time
    @user.save!
    self
  end

  private

  def available?
    return false if @user.unavailable_at.blank?
    @user.unavailable_at > Time.current
  end

  def unavailable?
    !available?
  end

  def determine_unavailable_at_time
    if @available
      @available_at + @available_for.minutes
    else
      Time.current
    end
  end
end
