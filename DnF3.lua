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
	return "ERROR: Happiness is out of range: "..happiness --if a value is never found then return an error
end

function displayStats(recentEvent) --just a stat display, the only input isnt even needed and is just a re-display of the most recent event
	print("Tax: "..tax.."%") --tax display, direct
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
		"Fire Advisor",
		"Wait"
	}
	if currentEconomy == "nazism" then --if nazism then . . .
		optionList[6] = "Change Genocide Options" -- . . . allow genocide
	end
	return optionList --return the finished list
end

function turnOptions(recentEvent,time,optionList) --no input required, though it will use a recent event if there is one present
	--local time = 100 --total time per turn, when its out, turn ends
	
	while time > 0 do --until time is up . . .
		displayStats(recentEvent) -- . . . display stats . . .
		local v,k,key = pickOption(optionList,"Next Action: ") -- . . . ask for next action . . .
		if key then
			v = optionList[k]
		end
		if v ~= "Wait" then
			optionList[k] = nil -- . . . then remove the action from the list
		end
		return v,list
	end
end

function turn(recentEvent)
	local time = 3
	local actionTemp = ""
	local optionList = resetTurnOptions() --resetting option list
	while time > 0 do
		local v,optionList = turnOptions(recentEvent,time,optionList)
		if v == "Change Taxes" then
			local input = 1
			repeat
				io.write("New Tax: ")
				input = io.read("*line")
			until type(tonumber(input)) == "number"
			tax = tonumber(input)
			if tax > 100 then
				tax = 100
			end
			if tax < 0 then
				tax = 0
			end
			time = time-1
		elseif v == "Change Social Spending" then
			local input = 1
			repeat
				io.write("New Budget: ")
				input = io.read("*line")
			until type(tonumber(input)) == "number"
			socialSpending = tonumber(input)
			time = time-1
		elseif v == "Wait" then
			time = time-1
		end
		print("")
		print(time.." days left")
		print("")
	end
end

function effectTurn()
	population = population + math.floor((population/100))
	money = money+math.floor((population * (tax/100)))
	happiness = happiness + math.random(1,10)-5
	if socialSpending < 100 then
		happiness = happiness - 10
	elseif socialSpending >= 100 and socialSpending < 250 then
		happiness = happiness - 5
	elseif socialSpending >= 250 and socialSpending < 350 then

	elseif socialSpending >= 350 and socialSpending < 500 then 
		happiness = happiness + 5
	elseif socialSpending >= 500 and socialSpending < 1000 then
		happiness = happiness + 10
	elseif socialSpending >= 1000 then  
		happiness = happiness + 20
	end

	if tax < 5 then
		happiness = happiness + 10
	elseif tax < 10 and tax >= 15 then
		happiness = happiness + 5
	elseif tax < 15 and tax >= 20 then
		happiness = happiness-5
	elseif tax < 20 and tax >= 50 then
		happiness = happiness-10
	elseif tax >= 50 then
		happiness = happiness-25
	end

	if happiness > 100 then
		happiness = 100
	elseif happiness < 1 then
		happiness = 1
	end
end


-- temp for testing
currentEconomy = pickEconomy()
print(currentEconomy)
while true do
	turn()
	effectTurn()
end
-- end of temp