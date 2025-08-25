$.fn.jsPopover = function (options) {
	
	var defaults = {
            title: 'jQuery hunterPopup Demo',
            placement: 'left',
            width: '100%',
            height: '100%',
            content: $('<div><h3>jQuery hunterPopup Demo</h3></div>')
        };
	var obj = $.extend(defaults, options);
	
	console.log(obj);
        
	console.log($(this).offset());
	console.log($(this).outerHeight());

	var offsetTop = $(this).offset().top;
	var offsetLeft = $(this).offset().left;
	var outerHeight = $(this).outerHeight();
	
	$('#jsPopover_main').remove();
	
	
	var template = $('<div id="jsPopover_main" class="jsPopover">'+
						'<div class="jsPopover_triangle1"></div>'+
						'<div class="jsPopover_triangle2"></div>'+
						'<div class="jsPopover_content" id="jsPopover_content"></div>'+
					'</div>');
	var pop_wrap = $('#jsPopover_content', template);
	
	console.log(template);
	console.log(pop_wrap);
	console.log('js-popover');
	$('body').append(template);
	
	//pop_wrap.children().remove();
	
	pop_wrap.append($('#'+obj.content));
	pop_wrap.width(obj.width);
    pop_wrap.height(obj.height);
	
	$('#jsPopover_main').css('top',offsetTop + outerHeight + 5);
	$('#jsPopover_main').css('left',offsetLeft);
	//$('#jsPopover_main').width(obj.width);
	//$('#jsPopover_main').height(obj.height);
	//$('#jsPopover_content').appendTo('#'+obj.content);
	
	$(document).click(function() {
        template.remove();
    });
}