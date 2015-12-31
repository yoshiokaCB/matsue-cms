var date_format = {'format': 'yyyy-MM-dd hh:mm:ss UTC' };
$(function(){
  $('.datetimepicker').datetimepicker( date_format );
});

CKEDITOR.config.toolbar = [
    ['Source','-','Save','NewPage','Preview','-','Templates']
    ,['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print','SpellChecker']
    ,['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat']
    ,['Form','Checkbox','Radio','TextField','Textarea','Select','Button','ImageButton','HiddenField']
    ,'/'
    ,['Bold','Italic','Underline','Strike','-','Subscript','Superscript']
    ,['NumberedList','BulletedList','-','Outdent','Indent','Blockquote']
    ,['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock']
    ,['Link','Unlink','Anchor']
    ,['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
    ,'/'
    ,['Styles','Format','Font','FontSize']
    ,['TextColor','BGColor']
    ,['ShowBlocks']
];
