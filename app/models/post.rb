class Post < ActiveRecord::Base

	belongs_to :user

  def self.search(search)
  	if search
  		where(['user_id LIKE ?' , "#{search}" ])
  	else
  		all
  	end
  end

 



end
