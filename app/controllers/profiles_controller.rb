class ProfilesController < ApplicationController
  before_filter :load_profile, :only => [:edit, :update, :delete]
  skip_filter :create_profile, :only => [:new, :create]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new({
                               :name => current_user.name,
                               :email => current_user.email,
                               :user_name => current_user.email.split('@')[0]
                           })
  end

  def create
    @profile = Profile.create(params[:profile].
                                  merge({:user_id => current_user.id}))
    redirect_to profile_path(@profile) and return if @profile.errors.empty?
    redirect_to new_profile_path
  end

  def show
    redirect_to new_profile_path and return if no_profile_found
    redirect_to friendly_profile_path(Profile.find_by_user_id(current_user.id).user_name) and return if params[:username].nil?
    @profile = Profile.find_by_user_name(params[:username]) if params[:username].present?
    @sites = @profile.sites
    @providers = @profile.sites.collect(&:provider) if @profile.sites.present?
    authorize! :read, @profile
  end

  def no_profile_found
    params[:username].nil? and current_profile.nil?
  end

  def edit
    authorize! :edit, @profile
  end

  def update
    authorize! :update, @profile
    @profile.update_attributes(params[:profile])
    redirect_to profile_path(@profile)
  end

  def delete
    authorize! :delete, @profile
    @profile.delete
    redirect_to profile_path(@profile)
  end

  rescue_from ActiveRecord::RecordInvalid do
    render :edit
  end

  private
  def load_profile
    @profile = Profile.find(params[:id]) if params[:id].present?
  end

  def current_profile
    Profile.find_by_user_id(current_user.id)
  end
end
