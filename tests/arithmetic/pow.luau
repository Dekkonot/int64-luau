local int64 = require("../../")

local test_1 = int64.pow(int64.from_pair(0, 3), 4)
assert(int64.to_hex_string(test_1) == "0000000000000051", "pow test 1 (3 ^ 4) failed")

local test_2 = int64.pow(int64.from_pair(0, 5), 1)
assert(int64.to_hex_string(test_2) == "0000000000000005", "pow test 2 (5 ^ 1) failed")

local test_3 = int64.pow(int64.from_pair(0, 7), 0)
assert(int64.to_hex_string(test_3) == "0000000000000001", "pow test 3 (7 ^ 0) failed")

local test_4 = int64.pow(int64.from_pair(0, 1), 1000000)
assert(int64.to_hex_string(test_4) == "0000000000000001", "pow test 4 (1 ^ 1000000) failed")

local test_5 = int64.pow(int64.from_pair(0, 0), 1000000)
assert(int64.to_hex_string(test_5) == "0000000000000000", "pow test 5 (0 ^ 1000000) failed")

local test_6 = int64.pow(int64.from_pair(0, 5), 23)
assert(int64.to_hex_string(test_6) == "002a5a058fc295ed", "pow test 6 (5 ^ 23) failed")

local test_7 = int64.pow(int64.from_pair(0, 12345), 10)
assert(int64.to_hex_string(test_7) == "e806d2995ae9b971", "pow test 7 (12345 ^ 10) failed")

-- This matches the behavior of Luau, so we stick with it.
local test_8 = int64.pow(vector.zero, 0)
assert(int64.to_hex_string(test_8) == "0000000000000001", "pow test 8 (0 ^ 0) failed")

local test_9 = int64.pow(int64.from_pair(0xffffffff, 0xffffffff), 0xfffffff)
assert(int64.to_hex_string(test_9) == "ffffffffffffffff", "pow test 9 (0xffffffffffffffff ^ 0xffffffff) failed")

local test_10 = int64.pow(int64.from_pair(0xffffffff, 0xffffffff), 0xfffffffe)
assert(int64.to_hex_string(test_10) == "0000000000000001", "pow test 10 (0xffffffffffffffff ^ 0xfffffffe) failed")

--stylua: ignore
local pow_table = {
	"0000000000000002", "0000000000000004", "0000000000000008", "0000000000000010",
	"0000000000000020", "0000000000000040", "0000000000000080", "0000000000000100",
	"0000000000000200", "0000000000000400", "0000000000000800", "0000000000001000",
	"0000000000002000", "0000000000004000", "0000000000008000", "0000000000010000",
	"0000000000020000", "0000000000040000", "0000000000080000", "0000000000100000",
	"0000000000200000", "0000000000400000", "0000000000800000", "0000000001000000",
	"0000000002000000", "0000000004000000", "0000000008000000", "0000000010000000",
	"0000000020000000", "0000000040000000", "0000000080000000", "0000000100000000",
	"0000000200000000", "0000000400000000", "0000000800000000", "0000001000000000",
	"0000002000000000", "0000004000000000", "0000008000000000", "0000010000000000", 
	"0000020000000000", "0000040000000000", "0000080000000000", "0000100000000000",
	"0000200000000000", "0000400000000000", "0000800000000000", "0001000000000000",
	"0002000000000000", "0004000000000000", "0008000000000000", "0010000000000000",
	"0020000000000000", "0040000000000000", "0080000000000000", "0100000000000000",
	"0200000000000000", "0400000000000000", "0800000000000000", "1000000000000000",
	"2000000000000000", "4000000000000000", "8000000000000000", "0000000000000000",
}

assert(#pow_table == 64, "pow table was wrong length")

for i, expected in pow_table do
	local result = int64.to_hex_string(int64.pow(int64.from_pair(0, 2), i))
	if result ~= expected then
		error(`2 ^ {i} failed (expected {expected}, got {result})`)
	end
end

return {}
