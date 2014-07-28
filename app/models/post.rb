class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic, :counter_cache => true, :touch => true


  # Validations
  validates :body, :presence => true
  validates :user, :presence => true

  # Default Scope
  default_scope { where(order: 'created_at ASC') }

  # Scope to display only the last n posts. Used for "Recent Posts" display
  scope :recent, lambda {
    |c| reorder('created_at desc').limit(c)
  }

end
