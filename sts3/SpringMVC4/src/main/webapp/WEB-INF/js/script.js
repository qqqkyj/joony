/**
 * 
 */
 $(function(){
 	
 	$("#myimg").attr("src","../image/b1.png");
 	
 	var img = $("#myimg").attr("src");
 	
 	$("#myimg").hover(function(){
 		$(this).attr("src","../image/b2.png");
 	},function(){
 		$(this).attr("src",img);
 	})
 	
 	
 });