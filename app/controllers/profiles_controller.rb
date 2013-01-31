class ProfilesController < ApplicationController
  before_filter :load_profile, :only => [:edit, :update, :delete]

  def new
    @profile = Profile.new({
                               :name => current_user.name,
                               :email => current_user.email,
                               :user_name => current_user.email.split('@')[0]
                           })

  end

  def create
    @profile = Profile.create!(params[:profile].
                                   merge({:user_id => current_user.id}))
    redirect_to profile_path(@profile)
  end

  def show
    @profile = Profile.find_by_user_id(current_user.id)
    redirect_to new_profile_path if @profile.nil?
  end

  def edit
  end

  def update
    @profile.update_attributes(params[:profile])
    redirect_to profile_path(@profile)
  end

  def delete
    @profile.delete
    redirect_to profile_path(@profile)
  end

  rescue_from ActiveRecord::RecordInvalid do
    render :edit
  end

  private
  def load_profile
    @profile = Profile.find(params[:profile_id])
  end

end
