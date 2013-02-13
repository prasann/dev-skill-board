require 'json'

module StackOverflowAPI
  include HTTParty
  @@URL = "http://api.stackoverflow.com/1.1/"

  def self.get_user_reputation(user_id)
    result = get(@@URL + "users/#{user_id}")
    result["users"].first["reputation"]
  end

  def self.get_user(user_id)
    result = get(@@URL + "users/#{user_id}")
    return nil if result["users"].nil?
    result["users"].first
  end

  def self.get_questions_count(user_id)
    result = get(@@URL + "users/#{user_id}/questions")
    result["total"]
  end

  def self.get_answers_count(user_id)
    result = get(@@URL + "users/#{user_id}/answers")
    result["total"]
  end

  def self.get_user_tags(user_id)
    get(@@URL + "users/#{user_id}/tags")
  end

  def self.top_answer_tags(user_id)
    result = get(@@URL + "users/#{user_id}/top-answer-tags")
    result["top_tags"]
  end

  def self.top_question_tags(user_id)
    result = get(@@URL + "users/#{user_id}/top-question-tags")
    result["top_tags"]
  end
end