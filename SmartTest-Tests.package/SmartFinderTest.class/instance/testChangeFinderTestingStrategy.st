initialization
testChangeFinderTestingStrategy
	| finderTmp |
	smartFinder testingStrategy.
	finderTmp := SmTSenderTestFinderStrategy new.
	smartFinder smtFinder: finderTmp.
	self assert: smartFinder testingStrategy finder equals: finderTmp