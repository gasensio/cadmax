class Post < ActiveRecord::Base

	belongs_to :user


  validates_presence_of :user
  
  def self.search(search)
  	if search
      where(['cast(user_id as text) LIKE ? OR cast(proyecto as text) LIKE ? OR cast(cliente as text) LIKE ?' , "#{search}", "#{search}", "#{search}"])
  	else
  		all
  	end
  end
  
  def self.horasof_on(date)
  where("date(alta) = ?", date).sum(:horasof)
  end
  def self.horasnf_on(date)
  where("date(alta) = ?", date).sum(:horasnf)
  end
  def self.nocturnas_on(date)
  where("date(alta) = ?", date).sum(:nocturnas)
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
