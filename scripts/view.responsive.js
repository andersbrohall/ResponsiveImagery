/*global jQuery*/
(function (window) {
	"use strict";
	var $ = window.jQuery,
		view  = {
			responsive: {
				init: function () {
					this.setupVariables();
					this.resizeImages();
				},

				resizeTimeout: null,
				cookieWidth: null,
				contentWidth: 0,
				currentWidth: 0,

				setupVariables: function () {
					this.contentWidth = parseInt($('body > div').css('max-width'), 10);
				},

				resizeImages: function () {
					var that = this;
					
					this.cookieWidth = this.getCookie('imageWidth');

					$('img.full').each(function () {
						that.tryResizeImage($(this));
					});

					if (this.currentWidth == this.cookieWidth)
						return;

					document.cookie = 'imageWidth=' + escape(this.cookieWidth);

					$('.imageWidth').html(this.cookieWidth);
					$('.contentWidth').html($('body > div').width());
				},

				tryResizeImage: function (elem) {
					var src = elem.attr('src'),
						currentWidth = parseInt(elem.attr('src').substring(src.indexOf('&width=') + 7), 10),
						cookieWidth = this.cookieWidth,
						windowWidth = window.innerWidth < this.contentWidth ? window.innerWidth : this.contentWidth;
					
					if (windowWidth == currentWidth) {
						this.currentWidth = currentWidth;
						return;
					}

					if (cookieWidth === null)
						cookieWidth = windowWidth;

					if (cookieWidth > this.contentWidth)
						cookieWidth = this.contentWidth;
					else
						cookieWidth = windowWidth;
					
					if (typeof window.devicePixelRatio != 'undefined')
						cookieWidth = cookieWidth * window.devicePixelRatio;

					src = elem.attr('src').substring(0, src.indexOf('&width=') + 7);
					src += cookieWidth;
					elem.attr('src', src);

					this.currentWidth = currentWidth;
					this.cookieWidth = cookieWidth;
				},

				/* Refactor to seperate namespace START */
				getCookie: function (name) {
					var nameEq = name + "=";
					var ca = document.cookie.split(';');
					for (var i = 0; i < ca.length; i++) {
						var c = ca[i];
						while (c.charAt(0) == ' ') c = c.substring(1, c.length);
						if (c.indexOf(nameEq) == 0) return c.substring(nameEq.length, c.length);
					}
					return null;
				}
				/* Refactor to seperate namespace END*/
			}
		};

	window.onresize = function () {
		if (typeof window.stop !== 'undefined') {
			window.stop();
		} else if (typeof document.execCommand !== 'undefined') {
			if (window.parent.document.readyState !== 'complete')
				return;

			document.execCommand("Stop");
		}

		clearTimeout(view.responsive.resizeTimeout);
		view.responsive.resizeTimeout = setTimeout(function () {
			view.responsive.resizeImages();
		}, 250); // Might need adjustment if loading of images fail in Webkit.
	};
	
	$(document).ready(function () {
		view.responsive.init();
	});
	
} (window));


