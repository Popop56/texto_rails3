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
	
  def add_reply_link(form_builder)
    #form_builder.fields_for :replies, Reply.new, :child_index => 'NEW_RECORD' do |f|
      #html = render(:partial => 'reply', :locals => { :form => f })
      #page << "$('tasks').insert({ bottom: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
    #end    
    #form_builder.inspect
    link_to 'add a reply', 'javascript:void(0)', :class => "add_reply_field"
  end
	
end
