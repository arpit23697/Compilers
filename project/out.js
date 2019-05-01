function partition ( arr  , low  , high  ){
	var temp;
	var pivot = arr[high];
	var i = ( low - 1 );
	var j = low;
	while ( j <= high - 1 )	{
		if (arr[j] <= pivot )
		{
			var temp;
			i++ ;
			temp = arr[i];
			arr[i] = arr[j];
			arr[j] = temp;
			}
		j++ ;
		}
	temp = arr[i + 1];
	arr[i + 1] = arr[high];
	arr[high] = temp;
	 return ( i + 1 );
	}
function quickSort ( arr  , low  , high  ){
	if (low < high )
	{
		var pi = partition (arr,low,high );
		quickSort (arr,low,pi - 1 );
		quickSort (arr,pi + 1,high );
		}
	}
function printArray ( arr  , size  ){
	var i = 0;
	while ( i < size )	{
		document.write( arr[i]," ");
		i++ ;
		}
	document.write( "<br>");
	}
function main (  ){
	var arr = new Array(100);
	var n = 100;
	var i = 0;
	while ( i < n )	{
		arr[i] = 100 - i;
		i++ ;
		}
	document.write( "Before sorting <br>");
	printArray (arr,n );
	quickSort (arr,0,n - 1 );
	document.write( "Sorted array: <br>");
	printArray (arr,n );
	 return 0;
	}
var s = main();