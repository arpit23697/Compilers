function Fibonacci ( n  ){
	if ( n == 0 )
	 return 0;
	else	if ( n == 1 )
	 return 1;
	else	 return ( Fibonacci (n - 1 ) + Fibonacci (n - 2 ) );
	}
function main (  ){
	var n , i = 0 , c;
	n = 30;
	document.write( "Fibonacci series<br>");
	c = 1;
	while ( c <= n )	{
		document.write( Fibonacci (i )," <br>");
		i++ ;
		c++ ;
		}
	 return 0;
	}
var s = main();