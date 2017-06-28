require 'rails_helper'

describe Post do
  it { should have_many :comments }
  it { should validate_presence_of :artist_name }
  it { should validate_presence_of :content }

  describe ".init" do
    post = Post.create({:artist_name => "Bill", :content => "The best."})
    it { expect(post.rating).to(eq(0)) }
  end

  describe ".alphaAsc" do
    post1 = Post.create({:artist_name => "Z", :content => "The best."})
    post2 = Post.create({:artist_name => "A", :content => "The wurst."})
    Post.alphaAsc
    it { expect(Post.all()).to(eq([post2, post1]))}
  end
end
