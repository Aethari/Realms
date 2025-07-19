-- Generator for Rean words, because I couldn't stop myself from programming
-- For Rean language info, see other/rean.txt
-- 2025 Aetahri

-- == Vars =====================================================
-- syl_count = syllables per word
local word_count = 1
local syl_count = 2

local words = {}

local prefixes = {
	"a", "i", "e", "s", "r", "o",
	"aa", "ia", "sa", "ra",
	"ad", "id", "ed", "sed", "erd", "od",
	"ar", "ir", "or",
	"io", "eo", "so"
}

local suffixes = {
	"r",
	"aa", "ia", "ea", "sa", "ra",
	"ad", "id", "ed", "sed", "erd", "od",
	"ar", "ir", "er", "ser", "or",
	"ao", "io", "eo", "so", "ro", "oo"
}

-- == Generator function =======================================
local function gen_word()
	local plen = #prefixes
	local slen = #suffixes

	local word = ""

	for i = 1, syl_count do
		if i == 1 then
			local rand = math.random(1, plen)
			word = word..prefixes[rand]
		else
			local rand = math.random(1, slen)
			word = word..suffixes[rand]
		end
	end

	return word
end

-- == Main loop ================================================
local function main()
	io.write("\n")
	io.write("  Rean word generator (v 0.0.1 (alpha))\n")
	io.write("\n")
	io.write(" Rean language and generator by Aethari\n")
	io.write("      https://github.com/Aethari\n")
	io.write("-----------------------------------------\n")
	io.write("\n")

	::MAIN_CHOICES::
	io.write("Current config:\n")
	io.write("\tWord count: "..word_count.."\n")
	io.write("\tSyllable count: "..syl_count.."\n\n")

	io.write("1) Choose number of words\n")
	io.write("2) Choose number of syllables per word\n")
	io.write("3) Generate words\n")
	io.write("\n")

	io.write("Enter your choice: ")
	local choice = io.read()

	if choice == "1" then
		::NUM_CHOICE::
		io.write("\nEnter the number of words you want to generate: ")
		local num = io.read()

		if not tonumber(num) then
			io.write("\n\""..num.."\" is not a number. Please try again.\n")
			goto NUM_CHOICE
		else
			io.write("\n")
			word_count = num
			goto MAIN_CHOICES
		end
	elseif choice == "2" then
		::SYL_CHOICE::
		io.write("\nEnter the number of syllables to be generated for each word: ")
		local syl = io.read()

		if not tonumber(syl) then
			io.write("\n\""..syl.."\" is not a number. Please try again.\n")
			goto SYL_CHOICE
		else
			io.write("\n")
			syl_count = syl
			goto MAIN_CHOICES
		end
	elseif choice == "3" then
		io.write("\n")
		for i = 1, word_count do
			io.write(gen_word().."\n")
		end
	else
		io.write("\nOption \""..choice.."\" is invalid. Please try again.\n\n")
		goto MAIN_CHOICES
	end
end

main()
io.write("\n")
