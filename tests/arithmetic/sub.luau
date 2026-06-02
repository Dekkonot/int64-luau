local int64 = require("../../")

local max = int64.from_pair(0xFFFFFFFF, 0xFFFFFFFF)
local zero = int64.from_u32(0)
local one = int64.from_u32(1)

local subbed_max = int64.sub(max, max)
assert(int64.to_hex_string(subbed_max) == "0000000000000000", "max value - max value was not correct")
assert(subbed_max.x == 0b0000000000000000000000, "x component of max value - max value was not correct")
assert(subbed_max.y == 0b00000000000000000000, "y component of max value - max value was not correct")
assert(subbed_max.z == 0b0000000000000000000000, "z component of max value - max value was not correct")

local underflow = int64.sub(int64.from_pair(0x00000400, 0x00400001), max)
assert(int64.to_hex_string(underflow) == "0000040000400002", "intentional underflow of components is not correct")
assert(underflow.x == 0b0000000000000000000001, "x component of intentional underflow was not correct")
assert(underflow.y == 0b00000000000000000001, "y component of intentional underflow was not correct")
assert(underflow.z == 0b0000000000000000000010, "z component of intentional underflow was not correct")

local zero_min = int64.sub(zero, max)
assert(int64.to_hex_string(zero_min) == "0000000000000001", "subtracting max from 0 was wrong")
assert(zero_min.x == 0b0000000000000000000000, "x component of subtracting max from 0 was not correct")
assert(zero_min.y == 0b00000000000000000000, "y component of subtracting max from 0 was not correct")
assert(zero_min.z == 0b0000000000000000000001, "z component of subtracting max from 0 was not correct")

local zero_max = int64.sub(max, zero)
assert(int64.to_hex_string(zero_max) == "ffffffffffffffff", "subtracting 0 changed something")
assert(zero_max.x == 0b1111111111111111111111, "x component of subtracting 0 from max was not correct")
assert(zero_max.y == 0b11111111111111111111, "y component of subtracting 0 from max was not correct")
assert(zero_max.z == 0b1111111111111111111111, "z component of subtracting 0 from max was not correct")

local zero_zero = int64.sub(zero, zero)
assert(int64.to_hex_string(zero_zero) == "0000000000000000", "subtracting 0 to 0 was wrong")
assert(zero_zero.x == 0b0000000000000000000000, "x component of subtracting 0 from 0 was not correct")
assert(zero_zero.y == 0b00000000000000000000, "y component of subtracting 0 from 0 was not correct")
assert(zero_zero.z == 0b0000000000000000000000, "z component of subtracting 0 from 0 was not correct")

local large = vector.create(2 ^ 21 - 1, 2 ^ 20 - 1, 2 ^ 21 - 1)
local small = vector.create(10, 20, 30)
local subbed_large = int64.sub(large, small)
assert(int64.to_hex_string(subbed_large) == "7fffd7fffadfffe1", "large - small does not work")
assert(subbed_large.x == 0b0111111111111111110101, "x component of large - small was not correct")
assert(subbed_large.y == 0b11111111111111101011, "y component of large - small was not correct")
assert(subbed_large.z == 0b0111111111111111100001, "z component of large - small was not correct")

for lhs = 1, 2 ^ 8 do
	for rhs = 1, 2 ^ 8 do
		-- Sadly, real subtraction supports negatives to we have to improvise.
		local real_diff = string.format("%016x", lhs - rhs)
		local fake_diff = int64.sub(int64.from_u32(lhs), int64.from_u32(rhs))
		if int64.to_hex_string(fake_diff) ~= real_diff then
			error(`{lhs} - {rhs} did not equal {real_diff} (equaled {int64.to_hex_string(fake_diff)})`)
		end
	end
end

local exact_overflow = int64.sub(zero, one)
assert(int64.to_hex_string(exact_overflow) == "ffffffffffffffff", "0 - 1 was not correct")
assert(exact_overflow.x == 0x3fffff, "x component of 0 - 1 was wrong")
assert(exact_overflow.y == 0xfffff, "y component of 0 - 1 was wrong")
assert(exact_overflow.z == 0x3fffff, "z component of 0 - 1 was wrong")

return {}
