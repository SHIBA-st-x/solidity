contract C {
	uint x;
	function f(address a) public {
		(bool s, bytes memory data) = a.call("");
		assert(s); // should fail
		assert(!s); // should fail
	}
}
// ----
// Warning 2072: (65-82): Unused local variable.
// Warning 6328: (100-109): CHC: Assertion violation happens here.\nCounterexample:\nx = 0\na = 0\ns = false\ndata = [6, 6, 6, 6, 6, 6, 6, 6, 34, 6, 6]\n\nTransaction trace:\nC.constructor()\nState: x = 0\nC.f(0)\n    a.call("") -- untrusted external call
// Warning 6328: (128-138): CHC: Assertion violation happens here.\nCounterexample:\nx = 0\na = 0\ns = true\ndata = [6, 6, 6, 6, 6, 6, 6, 6, 32, 6, 6]\n\nTransaction trace:\nC.constructor()\nState: x = 0\nC.f(0)\n    a.call("") -- untrusted external call
