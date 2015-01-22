class User < ActiveRecord::Base

	has_many :submissions
	has_many :comments
	has_many :votes


	attr_accessor :remember_token
	before_save { self.email = email.downcase }
	validates :username,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  	validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

	validates :password, length: { minimum: 6 }

	has_secure_password

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #returns random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

    # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

    # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

	def vote(votable, upvote)
		@vote = votes.where(votable: votable).first
		if !@vote
			votes.create(votable: votable, upvote: upvote)
			if upvote === "true"
				votable.user.update_attribute(:reputation, votable.user.reputation+1)
			else
				votable.user.update_attribute(:reputation, votable.user.reputation-1)
			end
		else
			new_vote = (@vote.upvote.to_s != upvote)
			unvote(votable)
			if new_vote
				votes.create(votable: votable, upvote: upvote)
				if @vote.upvote.to_s === "true"
					votable.user.update_attribute(:reputation, votable.user.reputation-1)
				else
					votable.user.update_attribute(:reputation, votable.user.reputation+1)
				end
			end
		end
	end

	def unvote(votable)
		@vote = votes.where(votable: votable).first
		votes.find_by(votable: votable).try(:destroy)
		if @vote.upvote.to_s === "true"
			votable.user.update_attribute(:reputation, votable.user.reputation-1)
		else
			votable.user.update_attribute(:reputation, votable.user.reputation+1)
		end

	end

	def up_or_down_voted(votable)
		@vote = votes.where(votable: votable).first
		if !@vote
			0
		elsif @vote.upvote
			1
		else
			-1
		end
	end

    # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

end
