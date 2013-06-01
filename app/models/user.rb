class User < ActiveRecord::Base
  attr_accessible :email_address, :password, :first_name, :last_name, :salt
  validates :first_name, :presence => { :message => "First name required" }
  validates :last_name, :presence => { :message => "Last name required" }
  validates :email_address, :presence => { :message => "e-mail address required"}, 
  							:uniqueness  => {:message => "This e-mail address already registered.  Please log in."}
  validates :password, :presence => { :message => "Password required" }
  validates :password, :length => { :minimum => 8 , :message => "Password must be at least 8 characters"}
end
