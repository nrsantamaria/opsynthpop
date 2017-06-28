require 'rails_helper'

describe Post do
  it { should validate_presence_of :artist_name }
  it { should validate_presence_of :content }

  describe ".init" do
    post = Post.create({:artist_name => "Bill", :content => "The best."})
    it { expect(post.rating).to(eq(0)) }
  end
end
