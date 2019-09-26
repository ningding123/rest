
zoomIn = false; 

function showbook() { 
	
$("#magazine").turn({
		elevation: 50,
		acceleration: !isChrome(),
		autoCenter: true,
		//bind(($.isTouch) ? 'touchend' : 'click', zoomHandle).
		duration: 1500,
		pages: 112,
		width:960,
		height:600, 
		when: {

		turning: function(e, page, view) {
			
			var book = $(this),
				currentPage = book.turn('page'),
				pages = book.turn('pages');

			if (currentPage>3 && currentPage<pages-3) {
			
				if (page==1) {
					book.turn('page', 2).turn('stop').turn('page', page);
					e.preventDefault();
					return;
				} else if (page==pages) {
					book.turn('page', pages-1).turn('stop').turn('page', page);
					e.preventDefault();
					return;
				}

			} else if (page>3 && page<pages-3) {

				if (currentPage==1) {
					book.turn('page', 2).turn('stop').turn('page', page);
					e.preventDefault();
					return;
				} else if (currentPage==pages) {
					book.turn('page', pages-1).turn('stop').turn('page', page);
					e.preventDefault();
					return;
				}

			}
			console.log(page)
			updateDepth(book, page);
			
			if (page>=2)
				$('.book .p2').addClass('fixed');
			else
				$('.book .p2').removeClass('fixed');

			if (page<book.turn('pages'))
				$('.book .p111').addClass('fixed');
			else
				$('.book .p111').removeClass('fixed');

			// Update the spine position

			if (page==1)
				book.css({backgroundPosition: '482px 0'});
			else if(page==pages)
				book.css({backgroundPosition: '472px 0'});
			else
				book.css({backgroundPosition: '479px 0'});
				
		},

		turned: function(e, page, view) {


			var book = $(this),
				pages = book.turn('pages');

			updateDepth(book);

			//$('#slider').slider('value', getViewNumber(book, page));

			if (page==2 || page==3) {
				book.turn('peel', 'br');
			}

			book.turn('center');

		},

		start: function(e, pageObj, corner) {

			var book = $(this);

			//bookshelf.moveBar(true);

			if (pageObj.page==2)
				book.css({backgroundPosition: '482px 0'});
			else if (pageObj.page==book.turn('pages')-1)
				book.css({backgroundPosition: '472px 0'});

		},

		end: function(e, pageObj) {

			var book = $(this);

			updateDepth(book);
			setTimeout(function() {
				//$('#slider').slider('value', getViewNumber(book));
			}, 1);

			//bookshelf.moveBar(false);
		}
	}
		
		//$('#slider').slider('option', 'max', numberOfViews(flipbook));

		//flipbook.addClass('animated');
		
	});
		
	
}
	/*
	$("#magazine").turn({
		width: 960,
		height: 600,
		autoCenter: true
	});
	*/
	
function isChrome() {

	return navigator.userAgent.indexOf('Chrome')!=-1;

}

function updateDepth(book, newPage) {

	var page = book.turn('page'),
		pages = book.turn('pages'),
		depthWidth = 16*Math.min(1, page*2/pages);

		newPage = newPage || page;

	if (newPage>3)
		$('.book .p2 .depth').css({
			width: depthWidth,
			left: 20 - depthWidth
		});
	else
		$('.book .p2 .depth').css({width: 0});

		depthWidth = 16*Math.min(1, (pages-page)*2/pages);

	if (newPage<pages-3)
		$('.book .p111 .depth').css({
			width: depthWidth,
			right: 20 - depthWidth
		});
	else
		$('.book .p111 .depth').css({width: 0});

}


function moverto(page){
	$("#magazine").turn('page', page);
}

function movernext(){
	$("#magazine").turn('next');
	
}

function moverprv(){
	$("#magazine").turn('previous');
	
}


