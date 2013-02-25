class WallsController < ApplicationController
  def index
    @gitrepos = GithubRepo.find_all_by_user_id(current_user.id)
    language_classification
    stack_overflow_info
    linked_in_info
  end

  private
  def linked_in_info
    @linked_ins = LinkedIn.find_by_user_id(current_user.id)
  end

  def language_classification
    @language_array = []
    @gitrepos.group_by(&:language).each_pair do |key, value|
      @language_array << [key, value.length] if key.present?
    end
  end

  def stack_overflow_info
    @stack_overflow = StackOverflow.find_by_user_id(current_user.id)
  end
end

