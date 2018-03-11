settings
strategy: aSelector
	smTClassTestingStrategy disable.
	aSelector enable.
	smTClassTestingStrategy := aSelector.
	self testFinder testingStrategy: aSelector new.