class Post < ActiveRecord::Base
  has_many :comments
  validates :artist_name, :presence => true
  validates :content, :presence => true

  scope :alphaAsc, -> { order(artist_name: :asc)}
  scope :alphaDesc, -> { order(artist_name: :desc)}
  scope :creationNew, -> { order(created_at: :desc)}
  scope :creationOld, -> { order(created_at: :asc)}
  scope :mostComments, -> {(
    select("posts.id, posts.name, count(comments.id) as comments_count")
      .joins(:comments)
      .group("posts.id")
      .order("comments_count DESC")
      .limit(5)
    )}
  scope :leastComments, -> {(
    select("posts.id, posts.name, count(comments.id) as comments_count")
      .joins(:comments)
      .group("posts.id")
      .order("comments_count ASC")
      .limit(5)
    )}
  scope :highestRating, -> { order(rating: :desc)}

  def upvote
    self.rating += 1
  end

  def downvote
    self.rating -= 1
  end

end
