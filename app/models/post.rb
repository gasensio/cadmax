class Post < ActiveRecord::Base

	belongs_to :user
  has_many :proyectos
  has_many :clientes
  
  def self.search(search)
  	if search
  		where(['user_id LIKE ? OR proyecto LIKE ?' , "#{search}", "#{search}" ])
  	else
  		all
  	end
  end



  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |post|
      csv << post.attributes.values_at(*column_names)
    end
  end
end

 



end
