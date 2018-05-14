accessing
testingStrategy: aSmTTestingStrategy
	testingStrategy disable.
	testingStrategy := aSmTTestingStrategy.
	testingStrategy
		runner: self testRunner;
		finder: self smtFinder.
	testingStrategy enable.