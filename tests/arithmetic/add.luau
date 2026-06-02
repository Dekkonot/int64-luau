local int64 = require("../../")

local max = int64.from_pair(0xFFFFFFFF, 0xFFFFFFFF)
local zero = int64.from_u32(0)
local one = int64.from_u32(1)

local added_max = int64.add(max, max)
assert(int64.to_hex_string(added_max) == "fffffffffffffffe", "max value + max value was not correct")
assert(added_max.x == 0b1111111111111111111111, "x component of max value + max value was not correct")
assert(added_max.y == 0b11111111111111111111, "y component of max value + max value was not correct")
assert(added_max.z == 0b1111111111111111111110, "z component of max value + max value was not correct")

local overflow = int64.add(max, int64.from_pair(0x00000400, 0x00400001))
assert(int64.to_hex_string(overflow) == "0000040000400000", "intentional overflow of components is not correct")
assert(overflow.x == 0b0000000000000000000001, "x component of intentional overflow was not correct")
assert(overflow.y == 0b00000000000000000001, "y component of intentional overflow was not correct")
assert(overflow.z == 0b0000000000000000000000, "z component of intentional overflow was not correct")

local zero_max = int64.add(max, zero)
assert(int64.to_hex_string(zero_max) == "ffffffffffffffff", "adding 0 changed something")
assert(zero_max.x == 0b1111111111111111111111, "x component of adding zero 0 to max was not correct")
assert(zero_max.y == 0b11111111111111111111, "y component of adding zero 0 to max was not correct")
assert(zero_max.z == 0b1111111111111111111111, "z component of adding zero 0 to max was not correct")

local zero_zero = int64.add(zero, zero)
assert(int64.to_hex_string(zero_zero) == "0000000000000000", "adding 0 to 0 was wrong")
assert(zero_zero == vector.zero, "actual value of 0 + 0 was wrong")

local large = vector.create(2 ^ 21, 2 ^ 9, 2 ^ 21)
local added_large = int64.add(large, large)
assert(int64.to_hex_string(added_large) == "0000000100400000", "large but not overflowing addition does not work")
assert(added_large.x == 0b0000000000000000000000, "x component of large but not overflowing addition was not correct")
assert(added_large.y == 0b00000000010000000001, "y component of large but not overflowing addition was not correct")
assert(added_large.z == 0b0000000000000000000000, "z component of large but not overflowing addition was not correct")

for lhs = 1, 2 ^ 8 do
	for rhs = 1, 2 ^ 8 do
		local real_sum = lhs + rhs
		local fake_sum = int64.add(int64.from_u32(lhs), int64.from_u32(rhs))
		if int64.to_f64(fake_sum) ~= real_sum then
			error(`{lhs} + {rhs} did not equal {real_sum} (equaled {int64.to_f64(fake_sum)})`)
		end
	end
end

local exact_overflow = int64.add(max, one)
assert(int64.to_hex_string(exact_overflow) == "0000000000000000", "0xffffffffffffffff + 0x1 was not correct")
assert(exact_overflow.x == 0x000000, "x component of 0xffffffffffffffff + 0x1 was wrong")
assert(exact_overflow.y == 0x00000, "x component of 0xffffffffffffffff + 0x1 was wrong")
assert(exact_overflow.z == 0x000000, "x component of 0xffffffffffffffff + 0x1 was wrong")

return {}
