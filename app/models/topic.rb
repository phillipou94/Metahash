class Topic < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order(created_at: :desc) }
  validates :summary, presence: true, length: { maximum: 499 }
  validates :trending_reason, presence: true, length: { maximum: 499 }
  validates :title,  :presence => true, :length => { maximum: 50 },
            :uniqueness => { case_sensitive: false }




end
