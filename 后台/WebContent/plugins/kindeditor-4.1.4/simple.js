var editor;
KindEditor.ready(function(K) {
	editor = K.create('.editor', {
		resizeType : 1,
		allowPreviewEmoticons : false,
		allowImageUpload : false,
		afterBlur: function(){this.sync();},
		items : [
			'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
			'insertunorderedlist', '|', 'emoticons']
	});
});