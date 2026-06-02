local int64 = require("../../")

local test_1_a = int64.mult(int64.from_pair(0, 3), int64.from_pair(0, 5))
assert(int64.to_hex_string(test_1_a) == "000000000000000f", "test 1 a (3 * 5) failed")
local test_1_b = int64.mult(int64.from_pair(0, 5), int64.from_pair(0, 3))
assert(int64.to_hex_string(test_1_b) == "000000000000000f", "test 1 b (5 * 3) failed")
assert(test_1_a == test_1_b, "test 1 was not associative")
assert(test_1_a.x == 0b0000000000000000000000, "test 1 x component was not correct")
assert(test_1_a.y == 0b00000000000000000000, "test 1 y component was not correct")
assert(test_1_a.z == 0b0000000000000000001111, "test 1 z component was not correct")

local test_2_a = int64.mult(int64.from_pair(0, 7), int64.from_pair(0, 11))
assert(int64.to_hex_string(test_2_a) == "000000000000004d", "test 2 a (7 * 11) failed")
local test_2_b = int64.mult(int64.from_pair(0, 11), int64.from_pair(0, 7))
assert(int64.to_hex_string(test_2_b) == "000000000000004d", "test 2 b (11 * 7) failed")
assert(test_2_a == test_2_b, "test 2 was not associative")
assert(test_2_a.x == 0b0000000000000000000000, "test 2 x component was not correct")
assert(test_2_a.y == 0b00000000000000000000, "test 2 y component was not correct")
assert(test_2_a.z == 0b0000000000000001001101, "test 2 z component was not correct")

local test_3_a = int64.mult(vector.zero, vector.zero)
assert(test_3_a == vector.zero, "test 3 a (0 * 0) failed")
-- No associative test
assert(test_3_a.x == 0b0000000000000000000000, "test 3 x component was not correct")
assert(test_3_a.y == 0b00000000000000000000, "test 3 y component was not correct")
assert(test_3_a.z == 0b0000000000000000000000, "test 3 z component was not correct")

local test_4_a = int64.mult(int64.from_pair(0, 5), vector.zero)
assert(test_4_a == vector.zero, "test 4 a (5 * 0) failed")
local test_4_b = int64.mult(vector.zero, int64.from_pair(0, 5))
assert(test_4_b == vector.zero, "test 4 b (0 * 5) failed")
assert(test_4_a == test_4_b, "test 4 was not associative")
assert(test_4_a.x == 0b0000000000000000000000, "test 4 x component was not correct")
assert(test_4_a.y == 0b00000000000000000000, "test 4 y component was not correct")
assert(test_4_a.z == 0b000000000000000000000, "test 4 z component was not correct")

local test_5_a = int64.mult(int64.from_pair(0xffffffff, 0xffffffff), vector.zero)
assert(test_5_a == vector.zero, "test 5 a (0xffffffffffffffff * 0) failed")
local test_5_b = int64.mult(vector.zero, int64.from_pair(0xffffffff, 0xffffffff))
assert(test_5_b == vector.zero, "test 5 a (0 * 0xffffffffffffffff) failed")
assert(test_5_a == test_5_b, "test 5 was not associative")
assert(test_5_a.x == 0b0000000000000000000000, "test 5 x component was not correct")
assert(test_5_a.y == 0b00000000000000000000, "test 5 y component was not correct")
assert(test_5_a.z == 0b000000000000000000000, "test 5 z component was not correct")

local test_6_a = int64.mult(int64.from_pair(0, 1), int64.from_pair(0, 1))
assert(int64.to_hex_string(test_6_a) == "0000000000000001", "test 6 a (1 * 1) failed")
-- No associative test
assert(test_6_a.x == 0b0000000000000000000000, "test 6 x component was not correct")
assert(test_6_a.y == 0b00000000000000000000, "test 6 y component was not correct")
assert(test_6_a.z == 0b000000000000000000001, "test 6 z component was not correct")

local test_7_a = int64.mult(int64.from_pair(0xabcdef98, 0x76543210), int64.from_pair(0, 1))
assert(int64.to_hex_string(test_7_a) == "abcdef9876543210", "test 7a (0xabcdef9876543210 * 1) failed")
local test_7_b = int64.mult(int64.from_pair(0, 1), int64.from_pair(0xabcdef98, 0x76543210))
assert(int64.to_hex_string(test_7_b) == "abcdef9876543210", "test 7b (1 * 0xabcdef9876543210) failed")
assert(test_7_a == test_7_b, "test 7 was not associative")
assert(test_7_a.x == 0b1010101111001101111011, "test 7 x component was not correct")
assert(test_7_a.y == 0b11100110000111011001, "test 7 y component was not correct")
assert(test_7_a.z == 0b0101000011001000010000, "test 7 z component was not correct")

local test_8_a = int64.mult(int64.from_pair(0xffffffff, 0xffffffff), int64.from_pair(0xffffffff, 0xffffffff))
assert(int64.to_hex_string(test_8_a) == "0000000000000001", "test 8 a (0xffffffffffffffff * 0xffffffffffffffff) failed")
-- No associative test

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
	"2000000000000000", "4000000000000000", "8000000000000000",
}

assert(#pow_table == 63, "pow table was wrong length")

local last = int64.from_pair(0, 1)

for i, expected in pow_table do
	last = int64.mult(last, int64.from_pair(0, 2))
	if int64.to_hex_string(last) ~= expected then
		local truncated = string.match(expected, "^0*(%x+)$") or expected
		error(`mult by 2 cycle {i} failed (0x{truncated} * 2 was wrong)`)
	end
end

return {}
