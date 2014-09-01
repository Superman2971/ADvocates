class Business < ActiveRecord::Base
  include ActiveModel::SecurePassword
  has_many :campaigns, class_name: "Campaign", foreign_key: :business_id, inverse_of: :business
  has_secure_password

  validates_presence_of :name, :email, :password

  def add_tweets(money)
  	puts "HELLO!!!!!"
  	puts self.tweets
  	puts money
    @money = money
    if @money == "1000"
      self.update_attribute(:tweets, self.tweets + 5)
      puts self.tweets
    elsif @money == "3000"
      self.update_attribute(:tweets, self.tweets + 18)
    elsif @money == "10000"
      self.update_attribute(:tweets, self.tweets + 60)
    end
  end
end