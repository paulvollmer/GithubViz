/*
 * Will return a greenwich-like timestamp for dates like
 * Can process dates like:
 * Complete date plus hours, minutes, seconds and a decimal fraction of a second
 * YYYY-MM-DDThh:mm:ss.sTZD (eg 1997-07-16T19:20:30.45+01:00)
 * 
 */

var getTimestamp = function(dateString){
	return new Date(dateString).getTime();
}