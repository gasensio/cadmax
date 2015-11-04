class Foro < ActiveRecord::Base
	belongs_to :user
	belongs_to :proyecto

	validates_presence_of :proyecto
	validates_presence_of :titulo
	validates_presence_of :contenido


	def self.search(search)
  	if search
      where(['cast(proyecto_id as text) LIKE ?' , "#{search}"])
  	else
  		all
  	end
  end
end
