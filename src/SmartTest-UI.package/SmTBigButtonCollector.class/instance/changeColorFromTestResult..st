accessing
changeColorFromTestResult: aTestResult
	morph buttonMorph color: Color gray.
	aTestResult passedCount > 0
		ifTrue: [ morph buttonMorph color: Color green ].
	aTestResult hasFailures
		ifTrue: [ morph buttonMorph color: Color yellow ].
	aTestResult hasErrors
		ifTrue: [ morph buttonMorph color: Color red ].