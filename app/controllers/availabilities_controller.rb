class AvailabilitiesController < ApplicationController
  def update
    user = current_user
    user.update_attributes(available_at: Time.current, unavailable_at: unavailable_at)

    @welcome = UserWelcome.new(user)
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
    end
  end

  private

  def unavailable_at
    Time.current + available_time
  end

  def available_time
    params.require(:time).presence&.to_i
  end
end
