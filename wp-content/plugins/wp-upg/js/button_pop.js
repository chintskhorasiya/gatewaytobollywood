(function() {
	tinymce.PluginManager.add('upg_mce_button', function( editor, url ) {
		editor.addButton( 'upg_mce_button', {
			text: 'UPG',
			title : "User Post Gallery Shortcode",
			icon: true,
			image: url+'/odude.png',
			type: 'menubutton',
			
					menu: [
						{
							text: 'Image or Youtube Gallery',
							onclick: function() {
								editor.windowManager.open( {
									title: 'List Image Grid Shortcode',
									body: [
										{
											type: 'textbox',
											name: 'ptype',
											label: 'Image Album slug name',
											value: ''
										},
										
										{
											type: 'listbox',
											name: 'perrow',
											label: 'Display Per Row',
											'values': [
												{text: '1 Image', value: '1'},
												{text: '2 Images', value: '2'},
												{text: '3 Images', value: '3'},
												{text: '4 Images', value: '4'},
												{text: '5 Images', value: '5'}
											]
										},
										{
											type: 'textbox',
											name: 'perpage',
											label: 'Images Per Page',
											value: '30'
										},
										{
											type: 'listbox',
											name: 'orderby',
											label: 'Sort ecard as',
											'values': [
												{text: 'Order by posted date', value: 'date'},
												{text: 'Order by title', value: 'title'},
												{text: 'Order by last modified date', value: 'modified'},
												{text: 'Ramdom Order', value: 'rand'},
												{text: 'Order by post id', value: 'ID'}
											]
										},
										{
											type: 'listbox',
											name: 'page',
											label: 'WP-Pagenavi Page Navigation',
											'values': [
												{text: 'Hide Navigation', value: 'off'},
												{text: 'Show Navigation', value: 'on'}
												
											]
										},
										{
											type: 'listbox',
											name: 'layout',
											label: 'Set Layout',
											'values': [
												{text: 'List as Grid', value: 'list'},
												{text: 'Flat with description', value: 'flat'}
												
												
											]
										},
										{
											type: 'listbox',
											name: 'popup',
											label: 'Image Lightbox',
											'values': [
												{text: 'Hide Popup', value: 'off'},
												{text: 'Show Popup', value: 'on'}
												
											]
										}
									],
									onsubmit: function( e ) 
									{
										var return_text='[upg-list perrow="' + e.data.perrow + '" perpage="' + e.data.perpage + '"  orderby="' + e.data.orderby + '" page="' + e.data.page + '" layout="' + e.data.layout + '" popup="' + e.data.popup + '" album="' + e.data.ptype + '"]';
										
										if (e.data.ptype == null || e.data.ptype == '')
										return_text='[upg-list perrow="' + e.data.perrow + '" perpage="' + e.data.perpage + '" orderby="' + e.data.orderby + '" page="' + e.data.page + '" popup="' + e.data.popup + '" layout="' + e.data.layout + '" ]';
										
										editor.insertContent( return_text);
									}
								});
							}
						},
						{
							text: 'Frontend Post Form',
							onclick: function() {
								editor.windowManager.open( {
									title: 'Frontend Image/youtube Submit Form Shortcode',
									body: [
										
										
										{
											type: 'listbox',
											name: 'type',
											label: 'Select Form Type',
											'values': [
												{text: 'Image Only', value: 'image'},
												{text: 'Youtube URL', value: 'youtube'}
											]
										}
										
									],
									onsubmit: function( e ) 
									{
										var return_text='[upg-post type="' + e.data.type + '"]';
										
									
										
										editor.insertContent( return_text);
									}
								});
							}
						},
						{
							text: 'Inline Youtube Video',
							onclick: function() {
								editor.windowManager.open( {
									title: 'Display youtube thumbnail with popup',
									body: [
										
										
									{
											type: 'textbox',
											name: 'url',
											label: 'Youtube URL',
											value: 'http://'
										}
										
									],
									onsubmit: function( e ) 
									{
										var return_text='[upg-youtube url="' + e.data.url + '"]';
										
									
										
										editor.insertContent( return_text);
									}
								});
							}
						}
						
					]
				
			
		});
	});
})();