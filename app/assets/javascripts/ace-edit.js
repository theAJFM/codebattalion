function resizeAce() {
    console.log($(window).height());
    return $(window).height() < $('html').height()? $('#editor').height($('html').height()) : $('#editor').height($(window).height());
}
    //listen for changes
resizeAce();
var editor = ace.edit("editor");
var defaults = {"python":"#Enter your code here. Read input from STDIN. Print output to STDOUT", "ruby":"#Enter your code here. Read input from STDIN. Print output to STDOUT", "java":"//Enter your code here. Read input from STDIN. Print output to STDOUT. Name the class as Main."};
editor.setTheme("ace/theme/monokai");
editor.setShowPrintMargin(false);
editor.setFontSize(16);
editor.getSession().setMode("ace/mode/ruby");

$("#language").change(function() {
    editor.getSession().setMode("ace/mode/" + $(this).val());
    editor.setValue(defaults[$(this).val()], -1)
});

var code_sub = function(){
    $('#code').val(editor.getSession().getValue());
    return true;
};