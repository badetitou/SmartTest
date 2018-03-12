announcement handling
activated: aSelector
	aSelector
		ifTrue: [ self disableListenerTestCase.
			self enableListenerTestCase ]
		ifFalse: [ self disableListenerTestCase ]