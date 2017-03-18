--Advisor List

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

return {
	1 = {
		"name" = "Adolf Hitler",
		"happinessModifier" = 10,
		"otherDictatorLoyaltyModifier" = -1,
		"loyaltyModifier" = -2,
		"moneyAddedPerTurn" = 250,
		"taxModifier" = 0,
		"greedModifier" = 100,
		"socialSpendingModifier" = 0
	}
	2 = {
		"name" = "Stalin",
		"happinessModifier" = 6,
		"otherDictatorLoyaltyModifier" = 1,
		"loyaltyModifier" = 1,
		"moneyAddedPerTurn" = 40,
		"taxModifier" = 0,
		"greedModifier" = 90,
		"socialSpendingModifier" = 3
	}
	3 = {
		"name" = "Fidel Castro",
		"happinessModifier" = 7,
		"otherDictatorLoyaltyModifier" = 2,
		"loyaltyModifier" = 3,
		"moneyAddedPerTurn" = 50,
		"taxModifier" = 0,
		"greedModifier" = 30,
		"socialSpendingModifier" = 6
	}
	4 = {
		"name" = "Kim Jong Un",
		"happinessModifier" = -5,
		"otherDictatorLoyaltyModifier" = -3,
		"loyaltyModifier" = 3,
		"moneyAddedPerTurn" = 300,
		"taxModifier" = 3,
		"greedModifier" = 100,
		"socialSpendingModifier" = 0
	}
	5 = {
		"name" = "Mussolini",
		"happinessModifier" = 9,
		"otherDictatorLoyaltyModifier" = 3,
		"loyaltyModifier" = 3,
		"moneyAddedPerTurn" = 170,
		"taxModifier" =1,
		"greedModifier" = 10,
		"socialSpendingModifier" = 2
	}
	6 = {
		"name" = "Putin",
		"happinessModifier" = 7,
		"otherDictatorLoyaltyModifier" = 3,
		"loyaltyModifier" = 2,
		"moneyAddedPerTurn" = 150,
		"taxModifier" = 2,
		"greedModifier" = 60,
		"socialSpendingModifier" = 3
	}
	7 = {
		"name" = "Nigerian Prince",
		"happinessModifier" = -4,
		"otherDictatorLoyaltyModifier" = -1,
		"loyaltyModifier" = 3,
		"moneyAddedPerTurn" = 500,
		"taxModifier" = 3,
		"greedModifier" = 100,
		"socialSpendingModifier" = -3
	}		
}