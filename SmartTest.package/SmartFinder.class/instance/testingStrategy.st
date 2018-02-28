accessing
testingStrategy
	^ testingStrategy ifNil: [ testingStrategy := SmTClassTestingStrategy new runner: self testRunner; finder: self smtFinder ]