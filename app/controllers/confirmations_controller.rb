class ConfirmationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(Email: params[:user][:email].downcase)

    if @user.present? && user.unconfirmed?
      redirect_to root_path, notice: "Check your email for confirmation instructions."
    else
      redirect_to new_confirmation_path, alert: "We could not find a user with that email or that email has already been confirmed."
    end
  end

  def edit
    @user.find_signed(params[:confirmation_token], purpose: confirm_email)

    if @user.present?
      @user.confirm!
      redirect_to root_path, notice: "your account has been confirmed"
    else
      redirect_to new_confirmation_path, alert: "Invalid token."
    end

  end

end
