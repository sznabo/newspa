/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	config.toolbar = 'MyToolbar';//把默认工具栏改为‘MyToolbar’
	 
	config.toolbar_MyToolbar =
	[
	        
	        
	        { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
	        { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-',
	        '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
	        { name: 'links', items : [ 'Link','Unlink' ] },
	        { name: 'insert', items : [ 'Table','HorizontalRule','SpecialChar' ] },
	        '/',
	        { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
	        { name: 'colors', items : [ 'TextColor','BGColor' ] },
	];
	 
	config.toolbar_Basic =
	[
	        ['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-','About']
	];
};
