class Topic < ActiveRecord::Base
  belongs_to :editor, class_name: "User"

  has_many :submissions
  has_many :users, through: :submissions

  default_scope -> { order(created_at: :desc) }
  validates :summary, presence: true, length: { maximum: 499 }
  validates :trending_reason, presence: true, length: { maximum: 499 }
  validates :title,  :presence => true, :length => { maximum: 50 },
            :uniqueness => { case_sensitive: false }




end
