   		/** 
		* LOGGING
		* Make sure to include jQuery
		* usage: $('document').log("user " + theUserName + " exits - no need to fetch data!");
		* you can use any element to 'throw' the log i.e. $('div#aDiv').log("...");
		* this will be useful when using Firebug
		*/
		jQuery.fn.log = function (msg) {
			console.log("%s: %o", msg, this);
			return this;
		};