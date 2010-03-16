// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
	$('.add_reply_field').click(function(){
		var index = $(".reply").length;
		html = '<div class="reply">		  <p>		    <label for="texto_replies_attributes_'+index+'_content">Content</label>		    <textarea cols="40" id="texto_replies_attributes_'+index+'_content" name="texto[replies_attributes]['+index+'][content]" rows="20"></textarea></p></div>';
		console.log(html);
		$("#reply").append(html);
	});
});