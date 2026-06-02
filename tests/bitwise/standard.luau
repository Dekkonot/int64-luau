local int64 = require("../../")

local band_1 = int64.band(int64.from_pair(0, 0), int64.from_pair(0, 0))
assert(int64.to_hex_string(band_1) == "0000000000000000", "band_1 was wrong")

local band_2 = int64.band(int64.from_pair(0, 1), int64.from_pair(0, 1))
assert(int64.to_hex_string(band_2) == "0000000000000001", "band_2 was wrong")

local band_3 = int64.band(int64.from_pair(0, 0b1111), int64.from_pair(0, 0b0010))
assert(int64.to_hex_string(band_3) == "0000000000000002", "band_3 was wrong")

local band_4 = int64.band(int64.from_pair(0, 0b1010), int64.from_pair(0, 0b0101))
assert(int64.to_hex_string(band_4) == "0000000000000000", "band_4 was wrong")

local band_5 = int64.band(int64.from_pair(0, 0xdeadbeef), int64.from_pair(0, 0xdeadbeef))
assert(int64.to_hex_string(band_5) == "00000000deadbeef", "band_5 was wrong")

local band_6 = int64.band(int64.from_pair(0x10203040, 0x50607080), int64.from_pair(0x11223344, 0x55667788))
assert(int64.to_hex_string(band_6) == "1020304050607080", "band_6 was wrong")

for i = 0, 255 do
	for j = 0, 255 do
		local u32 = bit32.band(i, j)
		local u64 = int64.band(int64.from_pair(0, i), int64.from_pair(0, j))
		assert(int64.to_hex_string(u64) == string.format("%016x", u32), `band was wrong for {i} AND {j}`)
	end
end

local btest_1 = int64.btest(int64.from_pair(0, 0), int64.from_pair(0, 0))
assert(btest_1 == false, "btest_1 was wrong")

local btest_2 = int64.btest(int64.from_pair(0, 1), int64.from_pair(0, 1))
assert(btest_2 == true, "btest_2 was wrong")

local btest_3 = int64.btest(int64.from_pair(0, 0b1111), int64.from_pair(0, 0b0010))
assert(btest_3 == true, "btest_3 was wrong")

local btest_4 = int64.btest(int64.from_pair(0, 0b1010), int64.from_pair(0, 0b0101))
assert(btest_4 == false, "btest_4 was wrong")

local btest_5 = int64.btest(int64.from_pair(0, 0xdeadbeef), int64.from_pair(0, 0xdeadbeef))
assert(btest_5 == true, "btest_5 was wrong")

local btest_6 = int64.btest(int64.from_pair(0x10203040, 0x50607080), int64.from_pair(0x11223344, 0x55667788))
assert(btest_6 == true, "btest_6 was wrong")

for i = 0, 255 do
	for j = 0, 255 do
		local u32 = bit32.btest(i, j)
		local u64 = int64.btest(int64.from_pair(0, i), int64.from_pair(0, j))
		assert(u64 == u32, `btest was wrong for ({i}, {j})`)
	end
end

local bor_1 = int64.bor(int64.from_pair(0, 0), int64.from_pair(0, 0))
assert(int64.to_hex_string(bor_1) == "0000000000000000", "bor_1 was wrong")

local bor_2 = int64.bor(int64.from_pair(0, 1), int64.from_pair(0, 1))
assert(int64.to_hex_string(bor_2) == "0000000000000001", "bor_2 was wrong")

local bor_3 = int64.bor(int64.from_pair(0, 0b0010), int64.from_pair(0, 0b0100))
assert(int64.to_hex_string(bor_3) == "0000000000000006", "bor_3 was wrong")

local bor_4 = int64.bor(int64.from_pair(0, 0b1010), int64.from_pair(0, 0b0101))
assert(int64.to_hex_string(bor_4) == "000000000000000f", "bor_4 was wrong")

local bor_5 = int64.bor(int64.from_pair(0, 0xdeadbeef), int64.from_pair(0, 0xdeadbeef))
assert(int64.to_hex_string(bor_5) == "00000000deadbeef", "bor_5 was wrong")

local bor_6 = int64.bor(int64.from_pair(0x10203040, 0x50607080), int64.from_pair(0x11223344, 0x55667788))
assert(int64.to_hex_string(bor_6) == "1122334455667788", "bor_6 was wrong")

for i = 0, 255 do
	for j = 0, 255 do
		local u32 = bit32.bor(i, j)
		local u64 = int64.bor(int64.from_pair(0, i), int64.from_pair(0, j))
		assert(int64.to_hex_string(u64) == string.format("%016x", u32), `bor was wrong for {i} OR {j}`)
	end
end

local bxor_1 = int64.bxor(int64.from_pair(0, 0), int64.from_pair(0, 0))
assert(int64.to_hex_string(bxor_1) == "0000000000000000", "bxor_1 was wrong")

local bxor_2 = int64.bxor(int64.from_pair(0, 1), int64.from_pair(0, 1))
assert(int64.to_hex_string(bxor_2) == "0000000000000000", "bxor_2 was wrong")

local bxor_3 = int64.bxor(int64.from_pair(0, 0b0010), int64.from_pair(0, 0b0100))
assert(int64.to_hex_string(bxor_3) == "0000000000000006", "bxor_3 was wrong")

local bxor_4 = int64.bxor(int64.from_pair(0, 0b1010), int64.from_pair(0, 0b0101))
assert(int64.to_hex_string(bxor_4) == "000000000000000f", "bxor_4 was wrong")

local bxor_5 = int64.bxor(int64.from_pair(0, 0xdeadbeef), int64.from_pair(0, 0xdeadbeef))
assert(int64.to_hex_string(bxor_5) == "0000000000000000", "bxor_5 was wrong")

local bxor_6 = int64.bxor(int64.from_pair(0x10203040, 0x50607080), int64.from_pair(0x11223344, 0x55667788))
assert(int64.to_hex_string(bxor_6) == "0102030405060708", "bxor_6 was wrong")

for i = 0, 255 do
	for j = 0, 255 do
		local u32 = bit32.bxor(i, j)
		local u64 = int64.bxor(int64.from_pair(0, i), int64.from_pair(0, j))
		assert(int64.to_hex_string(u64) == string.format("%016x", u32), `bxor was wrong for {i} XOR {j}`)
	end
end

local bnot_1 = int64.bnot(int64.from_pair(0, 0))
assert(int64.to_hex_string(bnot_1) == "ffffffffffffffff", "bnot_1 was wrong")

local bnot_2 = int64.bnot(int64.from_pair(0, 1))
assert(int64.to_hex_string(bnot_2) == "fffffffffffffffe", "bnot_2 was wrong")

local bnot_3 = int64.bnot(int64.from_pair(0, 0b0010))
assert(int64.to_hex_string(bnot_3) == "fffffffffffffffd", "bnot_3 was wrong")

local bnot_4 = int64.bnot(int64.from_pair(0, 0b1010))
assert(int64.to_hex_string(bnot_4) == "fffffffffffffff5", "bnot_4 was wrong")

local bnot_5 = int64.bnot(int64.from_pair(0, 0xdeadbeef))
assert(int64.to_hex_string(bnot_5) == "ffffffff21524110", "bnot_5 was wrong")

local bnot_6 = int64.bnot(int64.from_pair(0x1a2b3c4d, 0x5e6f7988))
assert(int64.to_hex_string(bnot_6) == "e5d4c3b2a1908677", "bnot_6 was wrong")

for i = 0, 255 do
	local u32 = bit32.bnot(i)
	local u64 = int64.bnot(int64.from_pair(0, i))
	-- Because `bit32.bnot` is 32-bit, we have to manually fill in the upper
	-- bits else our comparison is wrong.
	assert(int64.to_hex_string(u64) == `ffffffff{string.format("%08x", u32)}`, `bnot was wrong for NOT {i}`)
end

assert(int64.countrz(vector.zero) == 64, "countrz was wrong for 0")
assert(int64.countlz(vector.zero) == 64, "countlz was wrong for 0")

for i = 0, 52 do
	local u64 = int64.from_f64(2 ^ i)
	assert(int64.countrz(u64) == i, `countrz was wrong for 2 ^ {i}`)
	-- We have a bit set, so it's going to be off by one from what you may
	-- expect.
	assert(int64.countlz(u64) == 63 - i, `countlz was wrong for 2 ^ {i}`)
end

assert(int64.countrz(int64.from_pair(0x00200000, 0x00000000)) == 53, "countrz was wrong for 2 ^ 53")
assert(int64.countlz(int64.from_pair(0x00200000, 0x00000000)) == 10, "countlz was wrong for 2 ^ 53")

assert(int64.countrz(int64.from_pair(0x00400000, 0x00000000)) == 54, "countrz was wrong for 2 ^ 54")
assert(int64.countlz(int64.from_pair(0x00400000, 0x00000000)) == 9, "countlz was wrong for 2 ^ 54")

assert(int64.countrz(int64.from_pair(0x00800000, 0x00000000)) == 55, "countrz was wrong for 2 ^ 55")
assert(int64.countlz(int64.from_pair(0x00800000, 0x00000000)) == 8, "countlz was wrong for 2 ^ 55")

assert(int64.countrz(int64.from_pair(0x01000000, 0x00000000)) == 56, "countrz was wrong for 2 ^ 56")
assert(int64.countlz(int64.from_pair(0x01000000, 0x00000000)) == 7, "countlz was wrong for 2 ^ 56")

assert(int64.countrz(int64.from_pair(0x02000000, 0x00000000)) == 57, "countrz was wrong for 2 ^ 57")
assert(int64.countlz(int64.from_pair(0x02000000, 0x00000000)) == 6, "countlz was wrong for 2 ^ 57")

assert(int64.countrz(int64.from_pair(0x04000000, 0x00000000)) == 58, "countrz was wrong for 2 ^ 58")
assert(int64.countlz(int64.from_pair(0x04000000, 0x00000000)) == 5, "countlz was wrong for 2 ^ 58")

assert(int64.countrz(int64.from_pair(0x08000000, 0x00000000)) == 59, "countrz was wrong for 2 ^ 59")
assert(int64.countlz(int64.from_pair(0x08000000, 0x00000000)) == 4, "countlz was wrong for 2 ^ 59")

assert(int64.countrz(int64.from_pair(0x10000000, 0x00000000)) == 60, "countrz was wrong for 2 ^ 60")
assert(int64.countlz(int64.from_pair(0x10000000, 0x00000000)) == 3, "countlz was wrong for 2 ^ 60")

assert(int64.countrz(int64.from_pair(0x20000000, 0x00000000)) == 61, "countrz was wrong for 2 ^ 61")
assert(int64.countlz(int64.from_pair(0x20000000, 0x00000000)) == 2, "countlz was wrong for 2 ^ 61")

assert(int64.countrz(int64.from_pair(0x40000000, 0x00000000)) == 62, "countrz was wrong for 2 ^ 62")
assert(int64.countlz(int64.from_pair(0x40000000, 0x00000000)) == 1, "countlz was wrong for 2 ^ 62")

assert(int64.countrz(int64.from_pair(0x80000000, 0x00000000)) == 63, "countrz was wrong for 2 ^ 63")
assert(int64.countlz(int64.from_pair(0x80000000, 0x00000000)) == 0, "countlz was wrong for 2 ^ 63")

assert(int64.countrz(int64.from_pair(0x00000000, 0x00000000)) == 64, "countrz was wrong for 2 ^ 64 (or 0)")
assert(int64.countlz(int64.from_pair(0x00000000, 0x00000000)) == 64, "countlz was wrong for 2 ^ 64 (or 0)")

local byteswap_1 = int64.byteswap(int64.from_pair(0xdeadbeef, 0xc0ffee42))
assert(int64.to_hex_string(byteswap_1) == "42eeffc0efbeadde", "byteswap_1 was not correct")

local byteswap_2 = int64.byteswap(int64.from_pair(0x11223344, 0x55667788))
assert(int64.to_hex_string(byteswap_2) == "8877665544332211", "byteswap_2 was not correct")

local byteswap_3 = int64.byteswap(int64.from_pair(0, 1))
assert(int64.to_hex_string(byteswap_3) == "0100000000000000", "byteswap_3 was not correct")

local byteswap_4 = int64.byteswap(int64.from_pair(0, 0))
assert(int64.to_hex_string(byteswap_4) == "0000000000000000", "byteswap_4 was not correct")

local byteswap_5 = int64.byteswap(int64.from_pair(0x00000075, 0x42000000))
assert(int64.to_hex_string(byteswap_5) == "0000004275000000", "byteswap_5 was not correct")

return {}
