/*
:name: associative-arrays-access-nonexistent
:description: Test access to nonexistent associative array element
:should_fail: 0
:tags: 7.8.6 7.9.1
*/
module top ();

int arr [ int ];
int r;

initial begin
	arr[10] = 10;
	$display(":assert: (%d == 1)", arr.size);

	// access nonexistent element
	$display(":re: BEGIN:ARRAY_NONEXISTENT");
	r = arr[9];
	$display(":re: END");
end

endmodule
