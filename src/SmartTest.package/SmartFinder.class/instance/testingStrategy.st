accessing
testingStrategy
	^ testingStrategy ifNil: [ testingStrategy :=  SmTTestingStrategyEachModification new runner: self testRunner; finder: self smtFinder ]