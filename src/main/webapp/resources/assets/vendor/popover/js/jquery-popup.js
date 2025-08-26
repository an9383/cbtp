/**
 * @author  likaifei
 *
 * 描述：弹出层组件，弹出的大小、内容和事件都可自定义。
 *
 * var popupEvent = function(){
 *      //这里写弹出层内组件的事件。
 * }
 *
 * $('.popup-div').hunterPopup({
 *      width: '320px',
 *      height:'450px',
 *      placement:'left',
 *      title:"这里是我传入的标题...",
 *      content:$('#tableContent'),
 *      event:popupEvent
 * });
 *
 * <div id="tableContent">...</div>
 *
 */


(function($) {
    $.hunterPopup = function(box, options) {
        var box = $(box);
        var defaults = {
            title: 'jQuery hunterPopup Demo',
            placement: 'left',
            width: '100%',
            height: '100%',
            content: $('<div><h3>jQuery hunterPopup Demo</h3></div>'),
            event: closePopup
        };
        var obj = $.extend(defaults, options);

        var template = $('<div class="Hunter-pop-up" id="Hunter-pop-up"><a class="close"><i class="glyphicon glyphicon-remove"></i></a><div class="arrow"></div><h3 class="title"></h3><div id="Hunter_pop_wrap" class="Hunter-wrap"></div></div>');
        var title = $('.title', template);
        var pop_wrap = $('#Hunter_pop_wrap', template);
        

        $(document).click(function() {
            template.addClass('d-none');
        });

        box.click(function(event) {
           template.removeClass('d-none');
           
            event.preventDefault();
            event.stopPropagation();
            $('.Hunter-pop-up').remove();
            var _this = $(this);
            var offset = _this.offset();
            var top = offset.top + _this.outerHeight() + 15;
            
            if(obj.placement == 'left') {
                template.css({
                    'left': offset.left,
                    'top': top
                });
            } else if(obj.placement == 'right') {
               template.addClass("Hunter-pop-up-right");
                if(isNaN(obj.width)) { // px단위가 아닐 경우
                   template.css({
                      'left':   'auto',
                      'right': $('body').width() - offset.left - (_this.width()),
                        'top': top
                    });
                } else {
                   template.css({
                        'right': offset.left - obj.width + _this.width() / 2,
                        'top': top
                    });                   
                }
            } else {
                template.addClass("Hunter-pop-up-right");
                if(isNaN(obj.width)) { // px단위가 아닐 경우
                   template.css({
                      'left': $('body').width() - offset.left - (_this.width() / 2),
                        'top': top
                    });
                } else {
                   template.css({
                        'left': offset.left - obj.width + _this.width() / 2,
                        'top': top
                    });                   
                }
                
            }

            buildPopup();
            $('body').append(template);
            $('.Hunter-pop-up').click(function(event) {
                event.stopPropagation();
            });

            //调用弹出层内容注册的事件。
            obj.event();
            
            
        });

        function buildPopup() {
            buildPopupContent();
            closePopup();
        };

        function buildPopupContent() {
            title.text(obj.title);

            //构造弹出层的内容
            var _content = obj.content;
            _content.show();
            pop_wrap.children().remove();
            pop_wrap.append(_content);
            pop_wrap.width(obj.width);
            pop_wrap.height(obj.height);
        };

        function closePopup() {
            template.on('click', '.close', function(event) {
                event.preventDefault();
                event.stopPropagation();
                template.addClass('d-none');
            });
        }
    };

    $.fn.extend({
        hunterPopup: function(options) {
            options = $.extend({}, options);
            this.each(function() {
                new $.hunterPopup(this, options);
            });
            return this;
        }

    });
})(jQuery);