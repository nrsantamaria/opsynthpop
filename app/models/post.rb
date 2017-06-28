class Post < ActiveRecord::Base
  validates :artist_name, :presence => true
  validates :content, :presence => true
  after_initialize :init

  def init
    self.rating = 0
  end
end
