function sum ( a  , n  ){
	var i = 0;
	var total = 0;
	while ( i < n )	{
		total += a[i];
		i += 1;
		}
	 return total;
	}
function main (  ){
	var a = new Array(100);
	var i = 0;
	var n = 100;
	n = 1;
	while ( i < n )	{
		a[i] = i;
		i += 1;
		}
	document.write( sum (a,n ));
	 return 0;
	}
var s = main();