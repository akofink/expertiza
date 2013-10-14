class DeadlineRight < ActiveRecord::Base
  has_many :allowed_submissions, :class_name => 'TopicDeadline', :foreign_key => :submission_allowed_id
  has_many :allowed_reviews, :class_name => 'TopicDeadline', :foreign_key => :review_allowed_id
end
