accessing
iconForTestFromTestsCasesHistory: aCollectionOfTestCase
	| iconType tempColor |
	iconType := #testNotRunIcon.
	aCollectionOfTestCase
		do: [ :aTestCase | 
			tempColor := self iconForTestFromTestCaseHistory: aTestCase.
			(tempColor = #testNotRunIcon)
				ifTrue: [ ^ #testNotRunIcon ].
			(tempColor = #testRedIcon)
				ifTrue: [ iconType := #testRedIcon ].
			(iconType = #testRedIcon)
				ifFalse: [ (tempColor = #testYellowIcon)
						ifTrue: [ iconType := #testYellowIcon ] ifFalse: [ iconType := tempColor  ] ] ].
				^ iconType 