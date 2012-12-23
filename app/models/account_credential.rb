class AccountCredential < ActiveRecord::Base
  belongs_to :user

  TYPES = {
    fb: 'facebook',
    tw: 'twitter'
  }

  attr_accessible :token, :uid, :account_type, :token_secret, :user_id

  validates :uid, :uniqueness => { :scope => :account_type,
                                  :message => "The social network account you have registered with us already exists in our system" },
                  :presence => true
  validates :account_type, :inclusion => { :in => TYPES.values }
end