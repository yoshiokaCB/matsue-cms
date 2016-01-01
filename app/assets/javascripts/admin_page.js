var date_format = {'format': 'yyyy-MM-dd hh:mm:ss UTC' };
$(function(){
  $('.datetimepicker').datetimepicker( date_format );
});

// # TODO: 要修正
// toubolinksの影響でリロードしないとCKEDITORが表示されない問題のため追記。
// 一番最初にエラーを吐き出すため、要修正。

$(document).bind('page:change', function() {
    $('.ckeditor').each(function() {
        CKEDITOR.replace('admin_page_body_text');
    });
    //jQuery.fn.exists = function(){return Boolean(this.length > 0);}
    //$('.ckeditor').each(function() {
    //    var selector = $('#cke_admin_page_body_text')
    //    console.log(selector.exists())
    //    if (!selector.exists()){
    //        CKEDITOR.replace('admin_page_body_text');
    //    }
    //});
});


