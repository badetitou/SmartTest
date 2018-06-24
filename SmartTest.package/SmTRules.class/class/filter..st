settings
filter: aSelector
	self testFinder filter: aSelector new.
	self propagateRegexToTestFinder.
	^ smTFilter := aSelector