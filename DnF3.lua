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
happiness = 100
--currentEconomy = "capitalism"

economyList = {
	"communism",
	"capitalism",
	"nazism",
	"marxism"
}

happyList = {
	"is rioting",
	"would rather die",
	"finds you revolting",
	"hates you",
	"is unhappy",
	"tolerates you",
	"is generally happy with you",
	"is happy with you",
	"highly approves of you",
	"looks up to you",
	"loves you"
}

function inList(list,val)
	local val = tostring(val)
	for k,v in pairs(list) do
		if v == val or tostring(k) == val then
			if tostring(k) == val then
				return tonumber(k),v,true
			end
			return tonumber(k),v,false
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
	local k,v,key = inList(list,input)
	return input,k,key
end

function pickEconomy()
	local k,v = pickOption(economyList,"What economy will you found?\n")
	local l,b,key = inList(economyList,v)
	if key == true then
		return economyList[k]
	else
		return v
	end
end

function getHappiness(happiness,happyList)
	local length = #happyList
	for i = 1,length do
		if happiness < i*(100/length) and happiness > (i*(100/length))-100/length then
			return happyList[i]
		end
	end
end

function displayStats(recentEvent)
	print("Tax : "..tax)
	print("Social Spending: "..socialSpending)
	print("Money: "..money)
	print("Population: "..population)
	if recentEvent ~= nil then
		print("Headlines: "..recentEvent)
	end
	print("The population is "..getHappiness(happiness,happyList))
end

function resetTurnOptions()
	local optionList = {
		"Change Taxes",
		"Change Social Spending",
		"Change Advisor Paycheck",
		"Fire Advisor"
	}
	if currentEconomy == "nazism" then
		optionList[5] = "Change Genocide Options"
	end
	return optionList
end

function turnOptions(recentEvent)
	local time = 100
	local optionList = resetTurnOptions()
	while time > 0 do
		displayStats(recentEvent)
		local v,k,key = pickOption(optionList,"Next Action: ")
		optionList[k] = nil
	end
end

currentEconomy = pickEconomy()
print(currentEconomy)
turnOptions()
