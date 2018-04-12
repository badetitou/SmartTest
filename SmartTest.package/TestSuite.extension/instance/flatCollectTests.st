*SmartTest
flatCollectTests
	^ tests
		ifNil: [ ^ {} ]
		ifNotNil: [ tests
				flatCollect: [ :t | 
					t isTestSuite
						ifTrue: [ t flatCollectTests ]
						ifFalse: [ {t} ] ] ]