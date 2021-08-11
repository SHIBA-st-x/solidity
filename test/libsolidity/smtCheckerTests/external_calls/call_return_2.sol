contract C {
	uint x;
	function f(address a) public {
		(bool s, bytes memory data) = a.call("");
		assert(data.length > 10); // should fail
	}
}
// ----
// Warning 2072: (57-63): Unused local variable.
// Warning 6328: (100-124): CHC: Assertion violation happens here.\nCounterexample:\nx = 0\na = 0\ns = false\ndata = [5]\n\nTransaction trace:\nC.constructor()\nState: x = 0\nC.f(0)\n    a.call("") -- untrusted external call
