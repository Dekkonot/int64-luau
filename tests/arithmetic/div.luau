local int64 = require("../../")

-- For numbers that are 53 bits or less, we can cheat and use floating point
-- division. These tests are just to make sure that works, even though it's
-- more of a formality than anything.

local sno_1_quo, sno_1_rem = int64.div(int64.from_pair(0, 10), int64.from_pair(0, 5))
assert(int64.to_hex_string(sno_1_quo) == "0000000000000002", "sno test 1 (10 // 5) quotient was wrong")
assert(int64.to_hex_string(sno_1_rem) == "0000000000000000", "sno test 1 (10 // 5) remainder was wrong")
assert(sno_1_quo.x == 0, "sno test 1 quotient had wrong x component")
assert(sno_1_quo.y == 0, "sno test 1 quotient had wrong y component")
assert(sno_1_quo.z == 2, "sno test 1 quotient had wrong z component")
assert(sno_1_rem.x == 0, "sno test 1 remainder had wrong x component")
assert(sno_1_rem.y == 0, "sno test 1 remainder had wrong y component")
assert(sno_1_rem.z == 0, "sno test 1 remainder had wrong z component")

local sno_2_quo, sno_2_rem = int64.div(vector.zero, int64.from_pair(0, 1))
assert(int64.to_hex_string(sno_2_quo) == "0000000000000000", "sno test 2 (0 // 1) quotient was wrong")
assert(int64.to_hex_string(sno_2_rem) == "0000000000000000", "sno test 2 (0 // 1) remainder was wrong")
assert(sno_2_quo.x == 0, "sno test 2 quotient had wrong x component")
assert(sno_2_quo.y == 0, "sno test 2 quotient had wrong y component")
assert(sno_2_quo.z == 0, "sno test 2 quotient had wrong z component")
assert(sno_2_rem.x == 0, "sno test 2 remainder had wrong x component")
assert(sno_2_rem.y == 0, "sno test 2 remainder had wrong y component")
assert(sno_2_rem.z == 0, "sno test 2 remainder had wrong z component")

local sno_3_quo, sno_3_rem = int64.div(int64.from_pair(0, 0x00500002), int64.from_pair(0, 0x00400001))
assert(int64.to_hex_string(sno_3_quo) == "0000000000000001", "sno test 3 (0x00500002 // 0x00400001) quotient was wrong")
assert(
	int64.to_hex_string(sno_3_rem) == "0000000000100001",
	"sno test 3 (0x00500002 // 0x00400001) remainder was wrong"
)
assert(sno_3_quo.x == 0, "sno test 3 quotient had wrong x component")
assert(sno_3_quo.y == 0, "sno test 3 quotient had wrong y component")
assert(sno_3_quo.z == 1, "sno test 3 quotient had wrong z component")
assert(sno_3_rem.x == 0, "sno test 3 remainder had wrong x component")
assert(sno_3_rem.y == 0, "sno test 3 remainder had wrong y component")
assert(sno_3_rem.z == 0x100001, "sno test 3 remainder had wrong z component")

local sno_4_quo, sno_4_rem = int64.div(int64.from_pair(0, 2), int64.from_pair(0, 5))
assert(int64.to_hex_string(sno_4_quo) == "0000000000000000", "sno test 4 (2 // 5) quotient was wrong")
assert(int64.to_hex_string(sno_4_rem) == "0000000000000002", "sno test 4 (2 // 5) remainder was wrong")
assert(sno_4_quo.x == 0, "sno test 4 quotient had wrong x component")
assert(sno_4_quo.y == 0, "sno test 4 quotient had wrong y component")
assert(sno_4_quo.z == 0, "sno test 4 quotient had wrong z component")
assert(sno_4_rem.x == 0, "sno test 4 remainder had wrong x component")
assert(sno_4_rem.y == 0, "sno test 4 remainder had wrong y component")
assert(sno_4_rem.z == 2, "sno test 4 remainder had wrong z component")

local sno_5_quo, sno_5_rem = int64.div(int64.from_pair(0, 1336), int64.from_pair(0, 7))
assert(int64.to_hex_string(sno_5_quo) == "00000000000000be", "sno test 5 (1336 // 7) quotient was wrong")
assert(int64.to_hex_string(sno_5_rem) == "0000000000000006", "sno test 5 (1336 // 7) remainder was wrong")
assert(sno_5_quo.x == 000, "sno test 5 quotient had wrong x component")
assert(sno_5_quo.y == 000, "sno test 5 quotient had wrong y component")
assert(sno_5_quo.z == 190, "sno test 5 quotient had wrong z component")
assert(sno_5_rem.x == 000, "sno test 5 remainder had wrong x component")
assert(sno_5_rem.y == 000, "sno test 5 remainder had wrong y component")
assert(sno_5_rem.z == 6, "sno test 5 remainder had wrong z component")

-- Outside of that opimization though, the normal code paths run.

local basic_1_quo, basic_1_rem = int64.div(int64.from_pair(0xffffffff, 0xffffffff), int64.from_pair(0, 1))
assert(
	int64.to_hex_string(basic_1_quo) == "ffffffffffffffff",
	"basic test 1 (0xffffffffffffffff // 0x1) quotient was wrong"
)
assert(
	int64.to_hex_string(basic_1_rem) == "0000000000000000",
	"basic test 1 (0xffffffffffffffff // 0x1) remainder was wrong"
)
assert(basic_1_quo.x == 0x3fffff, "basic test 1 quotient had wrong x component")
assert(basic_1_quo.y == 0x0fffff, "basic test 1 quotient had wrong y component")
assert(basic_1_quo.z == 0x3fffff, "basic test 1 quotient had wrong z component")
assert(basic_1_rem.x == 0, "basic test 1 remainder had wrong x component")
assert(basic_1_rem.y == 0, "basic test 1 remainder had wrong y component")
assert(basic_1_rem.z == 0, "basic test 1 remainder had wrong z component")

local basic_2_quo, basic_2_rem = int64.div(int64.from_pair(0xffffffff, 0xffffffff), int64.from_pair(0, 5))
assert(
	int64.to_hex_string(basic_2_quo) == "3333333333333333",
	"basic test 2 (0xffffffffffffffff // 0x5) quotient was wrong"
)
assert(
	int64.to_hex_string(basic_2_rem) == "0000000000000000",
	"basic test 2 (0xffffffffffffffff // 0x5) remainder was wrong"
)
assert(basic_2_quo.x == 0x0ccccc, "basic test 2 quotient had wrong x component")
assert(basic_2_quo.y == 0x0ccccc, "basic test 2 quotient had wrong y component")
assert(basic_2_quo.z == 0x333333, "basic test 2 quotient had wrong z component")
assert(basic_2_rem.x == 0, "basic test 2 remainder had wrong x component")
assert(basic_2_rem.y == 0, "basic test 2 remainder had wrong y component")
assert(basic_2_rem.z == 0, "basic test 2 remainder had wrong z component")

local basic_3_quo, basic_3_rem = int64.div(int64.from_pair(0xffffffff, 0x10), int64.from_pair(0xffffffff, 0x5))
assert(
	int64.to_hex_string(basic_3_quo) == "0000000000000001",
	"basic test 3 (0xffffffff00000010 // 0xffffffff00000005) quotient was wrong"
)
assert(
	int64.to_hex_string(basic_3_rem) == "000000000000000b",
	"basic test 3 (0xffffffff00000010 // 0xffffffff00000005) remainder was wrong"
)
assert(basic_3_quo.x == 0x000000, "basic test 3 quotient had wrong x component")
assert(basic_3_quo.y == 0x000000, "basic test 3 quotient had wrong y component")
assert(basic_3_quo.z == 0x000001, "basic test 3 quotient had wrong z component")
assert(basic_3_rem.x == 0x000000, "basic test 3 remainder had wrong x component")
assert(basic_3_rem.y == 0x000000, "basic test 3 remainder had wrong y component")
assert(basic_3_rem.z == 0x00000b, "basic test 3 remainder had wrong z component")

-- This is caught by an optimization but we assume that does not exist
-- because it's still something we should check.
local basic_4_quo, basic_4_rem = int64.div(vector.zero, int64.from_pair(0xffffffff, 0xffffffff))
assert(
	int64.to_hex_string(basic_4_quo) == "0000000000000000",
	"basic 4 test (0 // 0xffffffffffffffff) quotient was wrong"
)
assert(
	int64.to_hex_string(basic_4_rem) == "0000000000000000",
	"basic 4 test (0 // 0xffffffffffffffff) remainder was wrong"
)
assert(basic_4_quo.x == 0, "basic test 4 quotient had wrong x component")
assert(basic_4_quo.y == 0, "basic test 4 quotient had wrong y component")
assert(basic_4_quo.z == 0, "basic test 4 quotient had wrong z component")
assert(basic_4_rem.x == 0, "basic test 4 remainder had wrong x component")
assert(basic_4_rem.y == 0, "basic test 4 remainder had wrong y component")
assert(basic_4_rem.z == 0, "basic test 4 remainder had wrong z component")

local basic_5_quo, basic_5_rem =
	int64.div(int64.from_pair(0x50000200, 0x00500002), int64.from_pair(0x40000100, 0x00400001))
assert(
	int64.to_hex_string(basic_5_quo) == "0000000000000001",
	"basic test 5 (0x5000020000500002 // 0x4000010000400001) quotient was wrong"
)
assert(
	int64.to_hex_string(basic_5_rem) == "1000010000100001",
	"basic test 5 (0x5000020000500002 // 0x4000010000400001) remainder was wrong"
)
assert(basic_5_quo.x == 0, "basic test 5 quotient had wrong x component")
assert(basic_5_quo.y == 0, "basic test 5 quotient had wrong y component")
assert(basic_5_quo.z == 1, "basic test 5 quotient had wrong z component")
assert(basic_5_rem.x == 0x40000, "basic test 5 remainder had wrong x component")
assert(basic_5_rem.y == 0x40000, "basic test 5 remainder had wrong y component")
assert(basic_5_rem.z == 0x100001, "basic test 5 remainder had wrong z component")

local basic_6_quo, basic_6_rem =
	int64.div(int64.from_pair(0x20000000, 0x000000), int64.from_pair(0x50000000, 0x00000000))
assert(
	int64.to_hex_string(basic_6_quo) == "0000000000000000",
	"basic test 6 (0x2000000000000000 // 0x5000000000000000) quotient was wrong"
)
assert(
	int64.to_hex_string(basic_6_rem) == "2000000000000000",
	"basic test 6 (0x2000000000000000 // 0x5000000000000000) remainder was wrong"
)
assert(basic_6_quo.x == 0, "basic test 6 quotient had wrong x component")
assert(basic_6_quo.y == 0, "basic test 6 quotient had wrong y component")
assert(basic_6_quo.z == 0, "basic test 6 quotient had wrong z component")
assert(basic_6_rem.x == 0x80000, "basic test 6 remainder had wrong x component")
assert(basic_6_rem.y == 0, "basic test 6 remainder had wrong y component")
assert(basic_6_rem.z == 0, "basic test 6 remainder had wrong z component")

local basic_7_quo, basic_7_rem =
	int64.div(int64.from_pair(0x53800000, 0x00000000), int64.from_pair(0x00700000, 0x00000000))
assert(
	int64.to_hex_string(basic_7_quo) == "00000000000000be",
	"basic test 7 (0x5380000000000000 // 0x0070000000000000) quotient was wrong"
)
assert(
	int64.to_hex_string(basic_7_rem) == "0060000000000000",
	"basic test 7 (0x5380000000000000 // 0x0070000000000000) remainder was wrong"
)
assert(basic_7_quo.x == 000, "basic test 5 quotient had wrong x component")
assert(basic_7_quo.y == 000, "basic test 5 quotient had wrong y component")
assert(basic_7_quo.z == 190, "basic test 5 quotient had wrong z component")
assert(basic_7_rem.x == 0x001800, "basic test 5 remainder had wrong x component")
assert(basic_7_rem.y == 0, "basic test 5 remainder had wrong y component")
assert(basic_7_rem.z == 0, "basic test 5 remainder had wrong z component")

local divide_by_zero = pcall(int64.div, int64.from_pair(0, 1), vector.zero)
assert(not divide_by_zero, "dividing by zero did not throw an error")

-- Just as a sanity check, we want to test around the barrier for floats.

local MAX_FLOAT = 9007199254740992 -- 2 ^ 53

local float_max = int64.from_f64(MAX_FLOAT)
assert(int64.to_f64(float_max) == MAX_FLOAT, "max float did not survive roundtrip")
assert(int64.to_hex_string(float_max) == "0020000000000000", "max float quotient had wrong hex representation")

local threshold_1_quo, threshold_1_rem = int64.div(float_max, float_max)
assert(
	int64.to_hex_string(threshold_1_quo) == "0000000000000001",
	"threshold test 1 (0x1fffffffffffff // 0x1fffffffffffff) quotient was wrong"
)
assert(
	int64.to_hex_string(threshold_1_rem) == "0000000000000000",
	"threshold test 1 (0x1fffffffffffff // 0x1fffffffffffff) remainder was wrong"
)
assert(threshold_1_quo.x == 0, "threshold test 1 quotient had wrong x component")
assert(threshold_1_quo.y == 0, "threshold test 1 quotient had wrong y component")
assert(threshold_1_quo.z == 1, "threshold test 1 quotient had wrong z component")
assert(threshold_1_rem.x == 0, "threshold test 1 remainder had wrong x component")
assert(threshold_1_rem.y == 0, "threshold test 1 remainder had wrong y component")
assert(threshold_1_rem.z == 0, "threshold test 1 remainder had wrong z component")

-- 2 ^ 53 + 1
local float_max_plus_1 = int64.from_pair(0x200000, 0x00000001)

local threshold_2_quo, threshold_2_rem = int64.div(float_max_plus_1, float_max_plus_1)
assert(
	int64.to_hex_string(threshold_2_quo) == "0000000000000001",
	"threshold test 2 (0x20000000000001 // 0x20000000000001) quotient was wrong"
)
assert(
	int64.to_hex_string(threshold_2_rem) == "0000000000000000",
	"threshold test 2 (0x20000000000001 // 0x20000000000001) remainder was wrong"
)
assert(threshold_2_quo.x == 0, "threshold test 2 quotient had wrong x component")
assert(threshold_2_quo.y == 0, "threshold test 2 quotient had wrong y component")
assert(threshold_2_quo.z == 1, "threshold test 2 quotient had wrong z component")
assert(threshold_2_rem.x == 0, "threshold test 2 remainder had wrong x component")
assert(threshold_2_rem.y == 0, "threshold test 2 remainder had wrong y component")
assert(threshold_2_rem.z == 0, "threshold test 2 remainder had wrong z component")

-- 2 ^ 53 + 2
local float_max_plus_2 = int64.from_pair(0x200000, 0x00000002)

local threshold_3_quo, threshold_3_rem = int64.div(float_max_plus_2, float_max_plus_2)
assert(
	int64.to_hex_string(threshold_3_quo) == "0000000000000001",
	"threshold test 3 (0x20000000000002 // 0x20000000000002) quotient was wrong"
)
assert(
	int64.to_hex_string(threshold_3_rem) == "0000000000000000",
	"threshold test 3 (0x20000000000002 // 0x20000000000002) remainder was wrong"
)
assert(threshold_3_quo.x == 0, "threshold test 3 quotient had wrong x component")
assert(threshold_3_quo.y == 0, "threshold test 3 quotient had wrong y component")
assert(threshold_3_quo.z == 1, "threshold test 3 quotient had wrong z component")
assert(threshold_3_rem.x == 0, "threshold test 3 remainder had wrong x component")
assert(threshold_3_rem.y == 0, "threshold test 3 remainder had wrong y component")
assert(threshold_3_rem.z == 0, "threshold test 3 remainder had wrong z component")

-- This section brought to you by writing a Rust script to generate tests when
-- provided with input integers.

local mod_1_quo, mod_1_rem = int64.div(int64.from_pair(0x00000000, 0x00000010), int64.from_pair(0x00000000, 0x00000003))
assert(
	int64.to_hex_string(mod_1_quo) == "0000000000000005",
	"mod test 1 (0x0000000000000010 // 0x0000000000000003) quotient was wrong"
)
assert(
	int64.to_hex_string(mod_1_rem) == "0000000000000001",
	"mod test 1 (0x0000000000000010 // 0x0000000000000003) remainder was wrong"
)
assert(mod_1_quo.x == 0x000000, "mod test 1 quotient had wrong x component")
assert(mod_1_quo.y == 0x00000, "mod test 1 quotient had wrong y component")
assert(mod_1_quo.z == 0x000005, "mod test 1 quotient had wrong z component")
assert(mod_1_rem.x == 0x000000, "mod test 1 remainder had wrong x component")
assert(mod_1_rem.y == 0x00000, "mod test 1 remainder had wrong y component")
assert(mod_1_rem.z == 0x000001, "mod test 1 remainder had wrong z component")

local mod_2_quo, mod_2_rem = int64.div(int64.from_pair(0x00000000, 0x00000019), int64.from_pair(0x00000000, 0x00000005))
assert(
	int64.to_hex_string(mod_2_quo) == "0000000000000005",
	"mod test 2 (0x0000000000000019 // 0x0000000000000005) quotient was wrong"
)
assert(
	int64.to_hex_string(mod_2_rem) == "0000000000000000",
	"mod test 2 (0x0000000000000019 // 0x0000000000000005) remainder was wrong"
)
assert(mod_2_quo.x == 0x000000, "mod test 2 quotient had wrong x component")
assert(mod_2_quo.y == 0x00000, "mod test 2 quotient had wrong y component")
assert(mod_2_quo.z == 0x000005, "mod test 2 quotient had wrong z component")
assert(mod_2_rem.x == 0x000000, "mod test 2 remainder had wrong x component")
assert(mod_2_rem.y == 0x00000, "mod test 2 remainder had wrong y component")
assert(mod_2_rem.z == 0x000000, "mod test 2 remainder had wrong z component")

local mod_3_quo, mod_3_rem = int64.div(int64.from_pair(0x00000000, 0x00000011), int64.from_pair(0x00000000, 0x00000006))
assert(
	int64.to_hex_string(mod_3_quo) == "0000000000000002",
	"mod test 3 (0x0000000000000011 // 0x0000000000000006) quotient was wrong"
)
assert(
	int64.to_hex_string(mod_3_rem) == "0000000000000005",
	"mod test 3 (0x0000000000000011 // 0x0000000000000006) remainder was wrong"
)
assert(mod_3_quo.x == 0x000000, "mod test 3 quotient had wrong x component")
assert(mod_3_quo.y == 0x00000, "mod test 3 quotient had wrong y component")
assert(mod_3_quo.z == 0x000002, "mod test 3 quotient had wrong z component")
assert(mod_3_rem.x == 0x000000, "mod test 3 remainder had wrong x component")
assert(mod_3_rem.y == 0x00000, "mod test 3 remainder had wrong y component")
assert(mod_3_rem.z == 0x000005, "mod test 3 remainder had wrong z component")

local mod_4_quo, mod_4_rem = int64.div(int64.from_pair(0x0de0b6b3, 0xa763ffff), int64.from_pair(0x000462d5, 0x3c8abac0))
assert(
	int64.to_hex_string(mod_4_quo) == "000000000000032a",
	"mod test 4 (0x0de0b6b3a763ffff // 0x000462d53c8abac0) quotient was wrong"
)
assert(
	int64.to_hex_string(mod_4_rem) == "0000000218711c7f",
	"mod test 4 (0x0de0b6b3a763ffff // 0x000462d53c8abac0) remainder was wrong"
)
assert(mod_4_quo.x == 0x000000, "mod test 4 quotient had wrong x component")
assert(mod_4_quo.y == 0x00000, "mod test 4 quotient had wrong y component")
assert(mod_4_quo.z == 0x00032a, "mod test 4 quotient had wrong z component")
assert(mod_4_rem.x == 0x000000, "mod test 4 remainder had wrong x component")
assert(mod_4_rem.y == 0x00861, "mod test 4 remainder had wrong y component")
assert(mod_4_rem.z == 0x311c7f, "mod test 4 remainder had wrong z component")

local mod_5_quo, mod_5_rem = int64.div(int64.from_pair(0xffffffff, 0xfffffffe), int64.from_pair(0xffffffff, 0xffffffff))
assert(
	int64.to_hex_string(mod_5_quo) == "0000000000000000",
	"mod test 5 (0xfffffffffffffffe // 0xffffffffffffffff) quotient was wrong"
)
assert(
	int64.to_hex_string(mod_5_rem) == "fffffffffffffffe",
	"mod test 5 (0xfffffffffffffffe // 0xffffffffffffffff) remainder was wrong"
)
assert(mod_5_quo.x == 0x000000, "mod test 5 quotient had wrong x component")
assert(mod_5_quo.y == 0x00000, "mod test 5 quotient had wrong y component")
assert(mod_5_quo.z == 0x000000, "mod test 5 quotient had wrong z component")
assert(mod_5_rem.x == 0x3fffff, "mod test 5 remainder had wrong x component")
assert(mod_5_rem.y == 0xfffff, "mod test 5 remainder had wrong y component")
assert(mod_5_rem.z == 0x3ffffe, "mod test 5 remainder had wrong z component")

local mod_6_quo, mod_6_rem = int64.div(int64.from_pair(0x40000000, 0x00000000), int64.from_pair(0x00000001, 0x00000000))
assert(
	int64.to_hex_string(mod_6_quo) == "0000000040000000",
	"mod test 6 (0x4000000000000000 // 0x0000000100000000) quotient was wrong"
)
assert(
	int64.to_hex_string(mod_6_rem) == "0000000000000000",
	"mod test 6 (0x4000000000000000 // 0x0000000100000000) remainder was wrong"
)
assert(mod_6_quo.x == 0x000000, "mod test 6 quotient had wrong x component")
assert(mod_6_quo.y == 0x00100, "mod test 6 quotient had wrong y component")
assert(mod_6_quo.z == 0x000000, "mod test 6 quotient had wrong z component")
assert(mod_6_rem.x == 0x000000, "mod test 6 remainder had wrong x component")
assert(mod_6_rem.y == 0x00000, "mod test 6 remainder had wrong y component")
assert(mod_6_rem.z == 0x000000, "mod test 6 remainder had wrong z component")

local mod_7_quo, mod_7_rem = int64.div(int64.from_pair(0xffffffff, 0xffffffff), int64.from_pair(0x00000000, 0x00000002))
assert(
	int64.to_hex_string(mod_7_quo) == "7fffffffffffffff",
	"mod test 7 (0xffffffffffffffff // 0x0000000000000002) quotient was wrong"
)
assert(
	int64.to_hex_string(mod_7_rem) == "0000000000000001",
	"mod test 7 (0xffffffffffffffff // 0x0000000000000002) remainder was wrong"
)
assert(mod_7_quo.x == 0x1fffff, "mod test 7 quotient had wrong x component")
assert(mod_7_quo.y == 0xfffff, "mod test 7 quotient had wrong y component")
assert(mod_7_quo.z == 0x3fffff, "mod test 7 quotient had wrong z component")
assert(mod_7_rem.x == 0x000000, "mod test 7 remainder had wrong x component")
assert(mod_7_rem.y == 0x00000, "mod test 7 remainder had wrong y component")
assert(mod_7_rem.z == 0x000001, "mod test 7 remainder had wrong z component")

local mod_8_quo, mod_8_rem = int64.div(int64.from_pair(0xffffffff, 0xfffffffe), int64.from_pair(0x00000000, 0x00000002))
assert(
	int64.to_hex_string(mod_8_quo) == "7fffffffffffffff",
	"mod test 8 (0xfffffffffffffffe // 0x0000000000000002) quotient was wrong"
)
assert(
	int64.to_hex_string(mod_8_rem) == "0000000000000000",
	"mod test 8 (0xfffffffffffffffe // 0x0000000000000002) remainder was wrong"
)
assert(mod_8_quo.x == 0x1fffff, "mod test 8 quotient had wrong x component")
assert(mod_8_quo.y == 0xfffff, "mod test 8 quotient had wrong y component")
assert(mod_8_quo.z == 0x3fffff, "mod test 8 quotient had wrong z component")
assert(mod_8_rem.x == 0x000000, "mod test 8 remainder had wrong x component")
assert(mod_8_rem.y == 0x00000, "mod test 8 remainder had wrong y component")
assert(mod_8_rem.z == 0x000000, "mod test 8 remainder had wrong z component")

local mod_9_quo, mod_9_rem = int64.div(int64.from_pair(0xffffffff, 0xffffffc5), int64.from_pair(0x54312d3c, 0x41e94461))
assert(
	int64.to_hex_string(mod_9_quo) == "0000000000000003",
	"mod test 9 (0xffffffffffffffc5 // 0x54312d3c41e94461) quotient was wrong"
)
assert(
	int64.to_hex_string(mod_9_rem) == "036c784b3a4432a2",
	"mod test 9 (0xffffffffffffffc5 // 0x54312d3c41e94461) remainder was wrong"
)
assert(mod_9_quo.x == 0x000000, "mod test 9 quotient had wrong x component")
assert(mod_9_quo.y == 0x00000, "mod test 9 quotient had wrong y component")
assert(mod_9_quo.z == 0x000003, "mod test 9 quotient had wrong z component")
assert(mod_9_rem.x == 0x00db1e, "mod test 9 remainder had wrong x component")
assert(mod_9_rem.y == 0x12ce9, "mod test 9 remainder had wrong y component")
assert(mod_9_rem.z == 0x0432a2, "mod test 9 remainder had wrong z component")

return {}
