class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :postable, polymorphic: :true, dependent: :destroy
  belongs_to :topic
  belongs_to :trend, dependent: :destroy

  has_many :votes, as: :votable

  default_scope -> { order(created_at: :desc) }
  validates_presence_of :user_id
  validates_presence_of :postable
  validates_presence_of :trend_id
  validates :content, presence: true, length: { minimum: 2, maximum: 40020 }
  accepts_nested_attributes_for :postable

  def total_upvotes
    votes.where(upvote: true).count - votes.where(upvote: false).count
  end

  def update_score(gravity = 1.8)
    votes = self.total_upvotes
    age = Time.diff(Time.now, self.created_at)[:hour]
    score = (votes + 1) / (age + 2) ** gravity * 1000
    self.update_attribute(:score, score)
  end

  def Submission.update_scores
    Submission.all.each do |submission|
      submission.update_score()
    end
  end
end
