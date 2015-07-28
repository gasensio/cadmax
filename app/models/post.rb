class Post < ActiveRecord::Base

	belongs_to :user

  def self.search(search)
  	if search
  		where(['cast(user_id as text) LIKE ?' , "#{search}" ])
  	else
  		all
  	end
  end

 



end
