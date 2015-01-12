class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :postable, polymorphic: :true, dependent: :destroy
  belongs_to :topic

  has_many :votes, as: :votable

  default_scope -> { order(created_at: :desc) }
  validates_presence_of :user_id
  validates :content, presence: true, length: { minimum: 2, maximum: 140 }
  validates_presence_of :postable
  validates_presence_of :topic_id


  accepts_nested_attributes_for :postable

  def total_likes
    votes.where(liked: true).count
  end

  def update_score(gravity = 1.8)
    votes = self.total_likes
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
