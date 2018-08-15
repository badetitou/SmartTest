Extension { #name : #TestSuite }

{ #category : #'*SmartTest' }
TestSuite >> flatCollectTests [
	^ tests
		ifNil: [ ^ {} ]
		ifNotNil: [ tests
				flatCollect: [ :t | 
					t isTestSuite
						ifTrue: [ t flatCollectTests ]
						ifFalse: [ {t} ] ] ]
]

{ #category : #'*SmartTest' }
TestSuite >> isTestSuite [
	^ true
]
