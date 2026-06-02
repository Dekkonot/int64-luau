local int64 = require("../../")

local rrotate_n = int64.from_pair(0x80000000, 0x00000000)
for i = 0, 63 do
	local new = int64.rrotate(rrotate_n, i)
	local expected_bin = string.rep("0", i) .. "1" .. string.rep("0", 63 - i)
	assert(int64.to_bin_string(new) == expected_bin, `{int64.to_hex_string(rrotate_n)} RROT {i} was wrong`)
end
assert(int64.rrotate(rrotate_n, 64) == rrotate_n, `{int64.to_hex_string(rrotate_n)} RROT 64 was wrong`)

local rrotate_1 = int64.from_pair(0xcccccccc, 0xcccccccc)
assert(int64.rrotate(rrotate_1, 0) == rrotate_1, "0xcccccccccccccccc RROT 0 was wrong")

for i = 1, 64, 4 do
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_1, i)) == "6666666666666666",
		`0xcccccccccccccccc RROT {i} was wrong`
	)
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_1, i + 1)) == "3333333333333333",
		`0xcccccccccccccccc RROT {i + 1} was wrong`
	)
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_1, i + 2)) == "9999999999999999",
		`0xcccccccccccccccc RROT {i + 2} was wrong`
	)
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_1, i + 3)) == "cccccccccccccccc",
		`0xcccccccccccccccc RROT {i + 3} was wrong`
	)
end

for i = -64, 0, 4 do
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_1, i)) == "cccccccccccccccc",
		`0xcccccccccccccccc RROT {i} was wrong`
	)
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_1, i + 1)) == "6666666666666666",
		`0xcccccccccccccccc RROT {i + 1} was wrong`
	)
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_1, i + 2)) == "3333333333333333",
		`0xcccccccccccccccc RROT {i + 2} was wrong`
	)
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_1, i + 3)) == "9999999999999999",
		`0xcccccccccccccccc RROT {i + 3} was wrong`
	)
end

local rrotate_2 = int64.from_pair(0x33333333, 0x33333333)
assert(int64.rrotate(rrotate_2, 0) == rrotate_2, "0x3333333333333333 RROT 0 was wrong")

for i = 1, 64, 4 do
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_2, i)) == "9999999999999999",
		`0x3333333333333333 RROT {i} was wrong`
	)
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_2, i + 1)) == "cccccccccccccccc",
		`0x3333333333333333 RROT {i + 1} was wrong`
	)
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_2, i + 2)) == "6666666666666666",
		`0x3333333333333333 RROT {i + 2} was wrong`
	)
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_2, i + 3)) == "3333333333333333",
		`0x3333333333333333 RROT {i + 3} was wrong`
	)
end
for i = -64, 0, 4 do
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_2, i)) == "3333333333333333",
		`0x3333333333333333 RROT {i} was wrong`
	)
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_2, i + 1)) == "9999999999999999",
		`0x3333333333333333 RROT {i + 1} was wrong`
	)
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_2, i + 2)) == "cccccccccccccccc",
		`0x3333333333333333 RROT {i + 2} was wrong`
	)
	assert(
		int64.to_hex_string(int64.rrotate(rrotate_2, i + 3)) == "6666666666666666",
		`0x3333333333333333 RROT {i + 3} was wrong`
	)
end

local rrotate_3 = int64.from_pair(0xdeadbeef, 0x77c0ffee)

assert(int64.to_hex_string(int64.rrotate(rrotate_3, 00)) == "deadbeef77c0ffee", "0xdeadbeef77c0ffee RROT 0 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 01)) == "6f56df77bbe07ff7", "0xdeadbeef77c0ffee RROT  1 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 02)) == "b7ab6fbbddf03ffb", "0xdeadbeef77c0ffee RROT  2 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 03)) == "dbd5b7ddeef81ffd", "0xdeadbeef77c0ffee RROT  3 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 04)) == "edeadbeef77c0ffe", "0xdeadbeef77c0ffee RROT  4 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 05)) == "76f56df77bbe07ff", "0xdeadbeef77c0ffee RROT  5 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 06)) == "bb7ab6fbbddf03ff", "0xdeadbeef77c0ffee RROT  6 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 07)) == "ddbd5b7ddeef81ff", "0xdeadbeef77c0ffee RROT  7 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 08)) == "eedeadbeef77c0ff", "0xdeadbeef77c0ffee RROT  8 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 09)) == "f76f56df77bbe07f", "0xdeadbeef77c0ffee RROT  9 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 10)) == "fbb7ab6fbbddf03f", "0xdeadbeef77c0ffee RROT 10 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 11)) == "fddbd5b7ddeef81f", "0xdeadbeef77c0ffee RROT 11 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 12)) == "feedeadbeef77c0f", "0xdeadbeef77c0ffee RROT 12 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 13)) == "ff76f56df77bbe07", "0xdeadbeef77c0ffee RROT 13 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 14)) == "ffbb7ab6fbbddf03", "0xdeadbeef77c0ffee RROT 14 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 15)) == "ffddbd5b7ddeef81", "0xdeadbeef77c0ffee RROT 15 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 16)) == "ffeedeadbeef77c0", "0xdeadbeef77c0ffee RROT 16 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 17)) == "7ff76f56df77bbe0", "0xdeadbeef77c0ffee RROT 17 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 18)) == "3ffbb7ab6fbbddf0", "0xdeadbeef77c0ffee RROT 18 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 19)) == "1ffddbd5b7ddeef8", "0xdeadbeef77c0ffee RROT 19 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 20)) == "0ffeedeadbeef77c", "0xdeadbeef77c0ffee RROT 20 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 21)) == "07ff76f56df77bbe", "0xdeadbeef77c0ffee RROT 21 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 22)) == "03ffbb7ab6fbbddf", "0xdeadbeef77c0ffee RROT 22 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 23)) == "81ffddbd5b7ddeef", "0xdeadbeef77c0ffee RROT 23 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 24)) == "c0ffeedeadbeef77", "0xdeadbeef77c0ffee RROT 24 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 25)) == "e07ff76f56df77bb", "0xdeadbeef77c0ffee RROT 25 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 26)) == "f03ffbb7ab6fbbdd", "0xdeadbeef77c0ffee RROT 26 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 27)) == "f81ffddbd5b7ddee", "0xdeadbeef77c0ffee RROT 27 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 28)) == "7c0ffeedeadbeef7", "0xdeadbeef77c0ffee RROT 28 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 29)) == "be07ff76f56df77b", "0xdeadbeef77c0ffee RROT 29 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 30)) == "df03ffbb7ab6fbbd", "0xdeadbeef77c0ffee RROT 30 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 31)) == "ef81ffddbd5b7dde", "0xdeadbeef77c0ffee RROT 31 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 32)) == "77c0ffeedeadbeef", "0xdeadbeef77c0ffee RROT 32 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 33)) == "bbe07ff76f56df77", "0xdeadbeef77c0ffee RROT 33 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 34)) == "ddf03ffbb7ab6fbb", "0xdeadbeef77c0ffee RROT 34 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 35)) == "eef81ffddbd5b7dd", "0xdeadbeef77c0ffee RROT 35 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 36)) == "f77c0ffeedeadbee", "0xdeadbeef77c0ffee RROT 36 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 37)) == "7bbe07ff76f56df7", "0xdeadbeef77c0ffee RROT 37 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 38)) == "bddf03ffbb7ab6fb", "0xdeadbeef77c0ffee RROT 38 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 39)) == "deef81ffddbd5b7d", "0xdeadbeef77c0ffee RROT 39 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 40)) == "ef77c0ffeedeadbe", "0xdeadbeef77c0ffee RROT 40 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 41)) == "77bbe07ff76f56df", "0xdeadbeef77c0ffee RROT 41 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 42)) == "bbddf03ffbb7ab6f", "0xdeadbeef77c0ffee RROT 42 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 43)) == "ddeef81ffddbd5b7", "0xdeadbeef77c0ffee RROT 43 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 44)) == "eef77c0ffeedeadb", "0xdeadbeef77c0ffee RROT 44 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 45)) == "f77bbe07ff76f56d", "0xdeadbeef77c0ffee RROT 45 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 46)) == "fbbddf03ffbb7ab6", "0xdeadbeef77c0ffee RROT 46 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 47)) == "7ddeef81ffddbd5b", "0xdeadbeef77c0ffee RROT 47 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 48)) == "beef77c0ffeedead", "0xdeadbeef77c0ffee RROT 48 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 49)) == "df77bbe07ff76f56", "0xdeadbeef77c0ffee RROT 49 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 50)) == "6fbbddf03ffbb7ab", "0xdeadbeef77c0ffee RROT 50 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 51)) == "b7ddeef81ffddbd5", "0xdeadbeef77c0ffee RROT 51 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 52)) == "dbeef77c0ffeedea", "0xdeadbeef77c0ffee RROT 52 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 53)) == "6df77bbe07ff76f5", "0xdeadbeef77c0ffee RROT 53 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 54)) == "b6fbbddf03ffbb7a", "0xdeadbeef77c0ffee RROT 54 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 55)) == "5b7ddeef81ffddbd", "0xdeadbeef77c0ffee RROT 55 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 56)) == "adbeef77c0ffeede", "0xdeadbeef77c0ffee RROT 56 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 57)) == "56df77bbe07ff76f", "0xdeadbeef77c0ffee RROT 57 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 58)) == "ab6fbbddf03ffbb7", "0xdeadbeef77c0ffee RROT 58 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 59)) == "d5b7ddeef81ffddb", "0xdeadbeef77c0ffee RROT 59 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 60)) == "eadbeef77c0ffeed", "0xdeadbeef77c0ffee RROT 60 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 61)) == "f56df77bbe07ff76", "0xdeadbeef77c0ffee RROT 61 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 62)) == "7ab6fbbddf03ffbb", "0xdeadbeef77c0ffee RROT 62 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 63)) == "bd5b7ddeef81ffdd", "0xdeadbeef77c0ffee RROT 63 was wrong")
assert(int64.to_hex_string(int64.rrotate(rrotate_3, 64)) == "deadbeef77c0ffee", "0xdeadbeef77c0ffee RROT 64 was wrong")

return {}
