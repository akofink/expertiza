class TopicDeadline < ActiveRecord::Base
  belongs_to :topic, :class_name => 'SignUpTopic'
  belongs_to :submission_allowed, :class_name => 'DeadlineRight'
  belongs_to :review_allowed, :class_name => 'DeadlineRight'

  validate :due_at_is_valid_datetime

  def due_at_is_valid_datetime
    errors.add(:due_at, 'must be a valid datetime') if ((DateTime.strptime(due_at.to_s, '%Y-%m-%d %H:%M:%S') rescue ArgumentError) == ArgumentError)
  end
end
