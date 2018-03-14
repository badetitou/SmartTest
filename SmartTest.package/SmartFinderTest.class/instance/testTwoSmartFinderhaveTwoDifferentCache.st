initialization
testTwoSmartFinderhaveTwoDifferentCache
	| smartFinder2 |
	smartFinder2 := SmartFinder new.
	self deny: smartFinder currentCache == smartFinder2 currentCache