local int64 = require("../../")

local arshift_n = int64.from_pair(0x80000000, 0x00000000)
for i = 0, 63 do
	local new = int64.arshift(arshift_n, i)
	local expected_bin = string.rep("1", i) .. "1" .. string.rep("0", 63 - i)
	assert(int64.to_bin_string(new) == expected_bin, `{int64.to_hex_string(arshift_n)} >> {i} was wrong`)
end
assert(int64.arshift(arshift_n, 64) == int64.MAX, `{int64.to_hex_string(arshift_n)} >> 64 was wrong`)

local arshift_1 = int64.from_pair(0x80000000, 0xcccccccc)
assert(int64.arshift(arshift_1, 0) == arshift_1, "0x80000000cccccccc >> 0 was wrong")

assert(int64.to_hex_string(int64.arshift(arshift_1, 04)) == "f80000000ccccccc", "0xcccccccc >>  4 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 08)) == "ff80000000cccccc", "0xcccccccc >>  8 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 12)) == "fff80000000ccccc", "0xcccccccc >> 12 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 16)) == "ffff80000000cccc", "0xcccccccc >> 16 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 20)) == "fffff80000000ccc", "0xcccccccc >> 20 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 24)) == "ffffff80000000cc", "0xcccccccc >> 24 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 28)) == "fffffff80000000c", "0xcccccccc >> 28 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 32)) == "ffffffff80000000", "0xcccccccc >> 32 was wrong")

assert(int64.to_hex_string(int64.arshift(arshift_1, 02)) == "e000000033333333", "0xcccccccc >>  2 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 06)) == "fe00000003333333", "0xcccccccc >>  6 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 10)) == "ffe0000000333333", "0xcccccccc >> 10 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 14)) == "fffe000000033333", "0xcccccccc >> 14 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 18)) == "ffffe00000003333", "0xcccccccc >> 18 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 22)) == "fffffe0000000333", "0xcccccccc >> 22 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 26)) == "ffffffe000000033", "0xcccccccc >> 26 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 30)) == "fffffffe00000003", "0xcccccccc >> 30 was wrong")

assert(int64.to_hex_string(int64.arshift(arshift_1, 01)) == "c000000066666666", "0xcccccccc >>  1 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 03)) == "f000000019999999", "0xcccccccc >>  3 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 05)) == "fc00000006666666", "0xcccccccc >>  5 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 07)) == "ff00000001999999", "0xcccccccc >>  7 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 09)) == "ffc0000000666666", "0xcccccccc >>  9 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 11)) == "fff0000000199999", "0xcccccccc >> 11 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 13)) == "fffc000000066666", "0xcccccccc >> 13 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 15)) == "ffff000000019999", "0xcccccccc >> 15 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 17)) == "ffffc00000006666", "0xcccccccc >> 17 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 19)) == "fffff00000001999", "0xcccccccc >> 19 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 21)) == "fffffc0000000666", "0xcccccccc >> 21 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 23)) == "ffffff0000000199", "0xcccccccc >> 23 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 25)) == "ffffffc000000066", "0xcccccccc >> 25 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 27)) == "fffffff000000019", "0xcccccccc >> 27 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 29)) == "fffffffc00000006", "0xcccccccc >> 29 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 31)) == "ffffffff00000001", "0xcccccccc >> 31 was wrong")

-- Here's a little ditty I like to call "you make me so sad"

assert(int64.to_hex_string(int64.arshift(arshift_1, 33)) == "ffffffffc0000000", "0xcccccccc >> 33 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 34)) == "ffffffffe0000000", "0xcccccccc >> 34 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 35)) == "fffffffff0000000", "0xcccccccc >> 35 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 36)) == "fffffffff8000000", "0xcccccccc >> 36 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 37)) == "fffffffffc000000", "0xcccccccc >> 37 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 38)) == "fffffffffe000000", "0xcccccccc >> 38 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 39)) == "ffffffffff000000", "0xcccccccc >> 39 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 40)) == "ffffffffff800000", "0xcccccccc >> 40 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 41)) == "ffffffffffc00000", "0xcccccccc >> 41 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 42)) == "ffffffffffe00000", "0xcccccccc >> 42 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 43)) == "fffffffffff00000", "0xcccccccc >> 43 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 44)) == "fffffffffff80000", "0xcccccccc >> 44 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 45)) == "fffffffffffc0000", "0xcccccccc >> 45 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 46)) == "fffffffffffe0000", "0xcccccccc >> 46 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 47)) == "ffffffffffff0000", "0xcccccccc >> 47 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 48)) == "ffffffffffff8000", "0xcccccccc >> 48 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 49)) == "ffffffffffffc000", "0xcccccccc >> 49 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 50)) == "ffffffffffffe000", "0xcccccccc >> 50 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 51)) == "fffffffffffff000", "0xcccccccc >> 51 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 52)) == "fffffffffffff800", "0xcccccccc >> 52 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 53)) == "fffffffffffffc00", "0xcccccccc >> 53 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 54)) == "fffffffffffffe00", "0xcccccccc >> 54 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 55)) == "ffffffffffffff00", "0xcccccccc >> 55 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 56)) == "ffffffffffffff80", "0xcccccccc >> 56 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 57)) == "ffffffffffffffc0", "0xcccccccc >> 57 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 58)) == "ffffffffffffffe0", "0xcccccccc >> 58 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 59)) == "fffffffffffffff0", "0xcccccccc >> 59 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 60)) == "fffffffffffffff8", "0xcccccccc >> 60 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 61)) == "fffffffffffffffc", "0xcccccccc >> 61 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 62)) == "fffffffffffffffe", "0xcccccccc >> 62 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 63)) == "ffffffffffffffff", "0xcccccccc >> 63 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_1, 64)) == "ffffffffffffffff", "0xcccccccc >> 64 was wrong")

local arshift_2 = int64.from_u32(0x33333333) -- 00110011_00110011_00110011_00110011
assert(int64.arshift(arshift_2, 0) == arshift_2, "0x0000000033333333 >> 0 was wrong")

assert(int64.to_hex_string(int64.arshift(arshift_2, 04)) == "0000000003333333", "0x33333333 >>  4 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 08)) == "0000000000333333", "0x33333333 >>  8 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 12)) == "0000000000033333", "0x33333333 >> 12 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 16)) == "0000000000003333", "0x33333333 >> 16 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 20)) == "0000000000000333", "0x33333333 >> 20 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 24)) == "0000000000000033", "0x33333333 >> 24 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 28)) == "0000000000000003", "0x33333333 >> 28 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 32)) == "0000000000000000", "0x33333333 >> 32 was wrong")

assert(int64.to_hex_string(int64.arshift(arshift_2, 02)) == "000000000ccccccc", "0x33333333 >>  2 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 06)) == "0000000000cccccc", "0x33333333 >>  6 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 10)) == "00000000000ccccc", "0x33333333 >> 10 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 14)) == "000000000000cccc", "0x33333333 >> 14 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 18)) == "0000000000000ccc", "0x33333333 >> 18 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 22)) == "00000000000000cc", "0x33333333 >> 22 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 26)) == "000000000000000c", "0x33333333 >> 26 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 30)) == "0000000000000000", "0x33333333 >> 30 was wrong")

assert(int64.to_hex_string(int64.arshift(arshift_2, 01)) == "0000000019999999", "0x33333333 >>  1 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 03)) == "0000000006666666", "0x33333333 >>  3 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 05)) == "0000000001999999", "0x33333333 >>  5 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 07)) == "0000000000666666", "0x33333333 >>  7 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 09)) == "0000000000199999", "0x33333333 >>  9 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 11)) == "0000000000066666", "0x33333333 >> 11 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 13)) == "0000000000019999", "0x33333333 >> 13 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 15)) == "0000000000006666", "0x33333333 >> 15 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 17)) == "0000000000001999", "0x33333333 >> 17 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 19)) == "0000000000000666", "0x33333333 >> 19 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 21)) == "0000000000000199", "0x33333333 >> 21 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 23)) == "0000000000000066", "0x33333333 >> 23 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 25)) == "0000000000000019", "0x33333333 >> 25 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 27)) == "0000000000000006", "0x33333333 >> 27 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 29)) == "0000000000000001", "0x33333333 >> 29 was wrong")
assert(int64.to_hex_string(int64.arshift(arshift_2, 31)) == "0000000000000000", "0x33333333 >> 31 was wrong")

for i = 33, 64 do
	local shifted = int64.to_hex_string(int64.arshift(arshift_2, i))
	assert(shifted == "0000000000000000", `0x33333333 >> {i} was wrong`)
end

for i = -64, -1 do
	local shifted = pcall(int64.arshift, int64.ONE, i)
	assert(not shifted, "arshift allowed negative arguments when it shouldn't")
end

for i = 65, 128 do
	local shifted = int64.arshift(int64.MAX, i)
	assert(shifted == int64.MAX, "arshift did not work for values greater than 64 with MSB as 1")
end

for i = 65, 128 do
	local shifted = int64.arshift(int64.from_pair(0x7fffffff, 0xffffffff), i)
	assert(shifted == vector.zero, "arshift did not work for values greater than 64 with MSB as 0")
end

return {}
