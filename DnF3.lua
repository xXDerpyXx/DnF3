--[[
DICTATOR ADVISOR STAT EXAMPLE
(probably will be loaded from a file in the future)
list = {
	ID = {
		name="name",
		happinessModifier=5,
		loyaltyModifier=5,
		otherDictatorLoyaltyModifier=5,
		moneyAddedPerTurn=5,
		taxModifier=0,
		greedModifier=100, --means, that 300 is happiest, 200 is stable, and 100 is going down, and 100 or less is REALLY BAD
		socialSpendingModifier=0
	}
}

]]--

tax = 15
socialSpending = 250
population = 1000
money = 1000
currentEconomy = "capitalism"

economyList = {
	"communism",
	"capitalism",
	"nazism",


}

function inList(list,val)
	for k,v in pairs(list) do
		if v == val then
			return k,v
		end
	end
	return false
end

function pickOption(list,question)
	local input = ""
	while inList(list,input) == false do
		for k,v in pairs(list) do
			print(k..":"..v)
		end
		print("")
		io.write(question)
		input = io.read()
	end
	k,v = inList(list,input)
	return input,k
end

function pickEconomy(currentEconomy)
	k,v = pickOption(economyList,"What economy will you found?\n")
	if inList(economyList,v) == false then
		return economyList[k]
	else
		return v
	end
end