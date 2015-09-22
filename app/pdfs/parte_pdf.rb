class PartePdf < Prawn::Document

	def initialize(post)
		super(top_margin: 40)
		@post = post
		logo
		cliente
		proyecto
		pedido
		titular
		tabla
	
		horario
		footer

	end

 	def logo
	  logopath =  "#{Rails.root}/app/assets/images/logo-1.png"
	  image logopath, :width => 186, :height => 39, :position => :right

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
	def titular
		move_down 20
		text "Parte de trabajo diario", size: 16, style: :bold, align: :center
	end
	
	def tabla
		move_down 20
		table [["FECHA", "TIPO DE HORARIO", "HORARIO", "TIEMPO", "NOTAS"] ,
				["#{@post.alta}",
				 "#{'HN' if @post.horasof != nil if @post.horasof != 0} #{'HN' if @post.horasnf != nil if @post.horasnf != 0} #{'HE' if @post.extra != nil if @post.extra != 0} #{'HE' if @post.extraf != nil if @post.extraf != 0}",
				  "#{@post.inicio.strftime("%H:%M -") if @post.inicio != nil if @post.inicio != 0} #{@post.fin.strftime("%H:%M") if @post.fin != nil if @post.fin != 0}",
				   "#{@post.horasof} #{@post.horasnf} #{@post.extra} #{@post.extraf}",
				    "#{@post.content}"]
			], :column_widths => [100, 50, 100, 50, 240], :cell_style => { :size => 8, :border_color => "999999", :align => :center}, :row_colors => ["e5e5e5", "ffffff"]

	end
	def tecnico
		move_down 10
		data = [[" Tecnico #{@post.user.name}", "Cliente #{@post.cliente}"]]
		table(data, :column_widths => [270, 270], :cell_style => {:padding => 10, :height => 150,:size => 8, :border_color => "999999"})
	end
	def horario
		text_box "Tipo de Horarios

		HN - Hora normal
		HE - Hora extraordinaria (Sabados, Domingos, Festivos y Nocturnas)
		TE - Espera
		TV - Viaje",
		:at => [0, 120], size: 9
	end
	def footer
		text_box "CADMAX INGENIERIA S.L
		AVENIDA DE CASTILLA, Nº 1, 1ª PLANTA, OFICINA 12A. 28830 SAN FERNANDO DE HENARES. MADRID", align: :center, size: 8, :at => [0, 20]
	end
	

	
		
end