module TextosHelper
	
	def is_favorited(texto)
		html = ""
		
		favorited_texto = cookies[:favorited_texto].to_s.split(',')
		
		if favorited_texto.include?(texto.id.to_s)
			html = "[is favorite]"
		end
	end	
	
	def link_to_favorite(texto)
		html = ""
		favorited_texto = cookies[:favorited_texto].to_s.split(',')
		
		if !favorited_texto.include?(texto.id.to_s)
			html = link_to 'Add as Favorite!', favorite_texto_path(texto), :remote=>true
		end
	end		
	
end
