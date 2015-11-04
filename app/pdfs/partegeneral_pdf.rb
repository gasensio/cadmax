class PartegeneralPdf < Prawn::Document

	def initialize(post, date, view)
		super(top_margin: 40)
		@post = post
		@view = view
		@date = date
		logo
		direccion
		ingeniero
		titular
		tabla1
		nuevo
		horario
		tecnico



	end

 	def logo
	  logopath =  "#{Rails.root}/app/assets/images/logo-1.png"
	  image logopath, :width => 186, :height => 39, :position => :left

	end
	def direccion
		move_down 20
		text_box "CADMAX INGENIERIA S.L", align: :right, size: 12, :at => [0, 708]
		text_box " AVENIDA DE CASTILLA, Nº 1
		1ª PLANTA, OFICINA 12A
		SAN FERNANDO DE HENARES.
		28830, MADRID, ESPAÑA", align: :right, size: 8, :at => [0, 694]
	end

	def cliente
		text "Cliente: #{@post.cliente}", size: 12
			end
	def proyecto
		move_down 10
		text "Proyecto: #{@post.proyecto}", size: 12
	end
	def pedido
		move_down 10
		text "Pedido: #{@post.pedido}", size: 12
	end
	def ingeniero
		move_down 40
		text_box "<color rgb='0958a4'><b>Ingeniero:</b></color><b> #{@view.current_user.name}</b> ", size: 12, :color => "FFFFFF", :at => [0, 624], :inline_format => true
		text_box "<color rgb='0958a4'><b>Fecha:</b></color><b> #{Date.today} </color></b>", size: 12, :at => [0, 600], :color => 'f00000', :inline_format => true
	end
	def titular
		move_down 20
		text "<color rgb='0958a4'>Parte de trabajo mensual</color>", size: 16, style: :bold, align: :right, :color => "333333", :inline_format => true
	end
	def tabla1
		move_down 10
		table [["FECHA - DATE", "PROYECTO - PROJECT", "CLIENTE - CLIENT", "TARIFA  RATE", "HORARIO  SCHEDULE", "TIEMPO TIME", "NOTAS - REMARKS"],[]],:column_widths => [60, 90, 90, 40, 60, 50, 150], :cell_style => { :size => 7, :border_color => "999999", :align => :center}, :row_colors => ["e5e5e5", "ffffff"]
	end

	def nuevo

		data = [[]]
		Post.all.where(:user_id => @view.current_user, :alta => @date.beginning_of_month..@date.end_of_month).order(alta: :asc).map do |p|
			[p.alta, p.horasof, p.horasnf, p.extraf, p.extra, p.content]

		data += [[" #{p.alta}", "#{p.proyecto}", "#{p.cliente}",
				   "#{'HN' if p.horasof != nil if p.horasof != 0} #{'HE' if p.extra != nil if p.extra != 0} #{'HE' if p.extraf != nil if p.extraf != 0} #{'HE' if p.nocturnas != nil if p.nocturnas != 0} #{'TE' if p.espera != nil if p.espera != 0}	#{'TV' if p.viaje != nil if p.viaje != 0}" ,
				   "#{p.inicio.strftime("%H:%M -") if p.inicio != nil if p.inicio != 0} #{p.fin.strftime("%H:%M") if p.fin != nil if p.fin != 0}",
				   "#{p.horasof.to_f + p.horasnf.to_f + p.extra.to_f + p.extraf.to_f} h",
				   "#{p.content}" ]]
		end
        table(data, :header => true, :column_widths => [60, 90, 90, 40, 60, 50, 150], :cell_style => { :size => 8, :border_color => "999999", :align => :center}) 
        


    end
	
	def horario
		move_down 5
		text "Tipo de Horarios: N - Hora normal, E - Hora extraordinaria (Sabados, Domingos, Festivos y Nocturnas), E - Espera, V - Viaje", size: 8, :styles => :italic 
	end


	def tecnico
		move_down 10
		
		data = [[ "Firma Cadmax Ingenieria S.L

		Tecnico #{@view.current_user.name}","Firma Cliente#{@post.cliente}"]]
		 
		table(data, :column_widths => [270, 270], :cell_style => {:padding => 10, :height => 150,:size => 8, :border_color => "999999"})
	end






	

	
		
end