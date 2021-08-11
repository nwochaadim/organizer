class CommentSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :user_name, :body, :created_at

  def created_at
    time_ago_in_words(object.created_at)
  end
end
