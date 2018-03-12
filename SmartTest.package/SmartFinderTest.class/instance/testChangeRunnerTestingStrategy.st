initialization
testChangeRunnerTestingStrategy
	smartFinder testingStrategy.
	smartFinder testRunner: SmTRunnerStrategyDebug.
	self assert: smartFinder testingStrategy runner equals: SmTRunnerStrategyDebug.
	smartFinder testRunner: SmTRunnerStrategyNotice.
	self assert: smartFinder testingStrategy runner equals: SmTRunnerStrategyNotice