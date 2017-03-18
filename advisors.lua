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
}