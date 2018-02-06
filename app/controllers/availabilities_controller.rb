class AvailabilitiesController < ApplicationController
  def update
    Availability.new(user: user_params[:id],
                     available: user_params[:available],
                     available_for: user_params[:available_for].presence&.to_i).update

    user = User.find(user_params[:id])
    @welcome = UserWelcome.new(user)

    respond_to do |format|
      if user.update_attributes(user_params)
        format.html { redirect_to :root }
        format.js
      else
        flash[:error] = "Sorry, we couldn't update your availabilty. Try again soon!"
        head 500
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :mobile_number, :available, :available_for)
  end
end
