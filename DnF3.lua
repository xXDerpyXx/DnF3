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
math.randomseed(os.time())
tax = 15
socialSpending = 250
population = math.random(900,1100)
money = math.random(900,1100)
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

ethnicities = {
	"Jews",
	"Arabs",
	"Europeans",
	"Asians",
	"African",
	"Hispanic"
}

function inList(list,val) --the table you are looking in, the key/val you are looking for
	local val = tostring(val)
	for k,v in pairs(list) do
		if v == val or tostring(k) == val then
			if tostring(k) == val then
				return tonumber(k),v,true --return key as a number, return value, and return true since it was a key
			end
			return tonumber(k),v,false --return the key in a number if possible, the value, and false since its not a key
		end
	end
	return false  --return false if its not found
end

function pickOption(list,question) --table list of options, then the question asked as a string
	local input = "" --just a temp variable
	while inList(list,input) == false do
		for k,v in pairs(list) do
			print(k..":"..v) --printing keys and values
		end
		print("")
		io.write(question) --writing the question string . . .
		input = io.read() -- . . . then getting the output
	end
	local k,v,key = inList(list,input) --get the key, value and if it was a key
	return input,k,key --return the actual answer, the key, and if it was a key
end

function pickEconomy()
	local k,v = pickOption(economyList,"What economy will you found?\n") --using the pick option function but not taking the key since the next line does that
	local l,b,key = inList(economyList,v) --using l,b since k,v is already taken on the previous line
	if key == true then
		return economyList[tonumber(k)] --return the value via key
	else
		return v --return the value directly
	end
end

function getHappiness(happiness,happyList) --takes in the happy percentage and the list of happiness strings from worst to best
	local length = #happyList
	for i = 1,length do --going through the range
		if happiness < i*(100/length) and happiness > (i*(100/length))-100/length then --if its in range of the current percent then . . .
			return happyList[i] -- . . . return the string from the original list
		end
	end
	return "ERROR: Happiness is out of range" --if a value is never found then return an error
end

function displayStats(recentEvent) --just a stat display, the only input isnt even needed and is just a re-display of the most recent event
	print("Tax : "..tax) --tax display, direct
	print("Social Spending: "..socialSpending) --social spending display, direct
	print("Money: "..money) --money display, direct
	print("Population: "..population) --population display, vague (unknown proportions of ethnicities)
	if recentEvent ~= nil then --if there was a recent event . . .
		print("Headlines: "..recentEvent) -- . . . display it as a news headline
	end
	print("The population is "..getHappiness(happiness,happyList)) --happiness display, very vague
end

function resetTurnOptions() --reseting option list
	local optionList = {
		"Change Taxes",
		"Change Social Spending",
		"Change Advisor Paycheck",
		"Fire Advisor"
	}
	if currentEconomy == "nazism" then --if nazism then . . .
		optionList[5] = "Change Genocide Options" -- . . . allow genocide
	end
	return optionList --return the finished list
end

function turnOptions(recentEvent) --no input required, though it will use a recent event if there is one present
	local time = 100 --total time per turn, when its out, turn ends
	local optionList = resetTurnOptions() --resetting option list
	while time > 0 do --until time is up . . .
		displayStats(recentEvent) -- . . . display stats . . .
		local v,k,key = pickOption(optionList,"Next Action: ") -- . . . ask for next action . . .
		optionList[k] = nil -- . . . then remove the action from the list
	end
end

-- temp for testing
currentEconomy = pickEconomy()
print(currentEconomy)
turnOptions()
-- end of temp

