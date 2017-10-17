accessing
activated: aSelector
	activated := aSelector.
	activated ifTrue: [ SmTListener enableListenerTestCase ] ifFalse: [ SmTListener disableListenerTestCase  ]