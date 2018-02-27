action
notifyTitle: title contents: aTestResult

	 | contents |
	contents := aTestResult tests size > 3
		ifTrue: [ String streamContents: [ :aStream | 
				aStream 
					<< aTestResult tests size
					<< ' tests in: '.
				(aTestResult tests collect: #class as: Set) 
					do: [ :eachClass | aStream << eachClass name ]
					separatedBy: [ aStream << ', ' ] ] ]
		ifFalse: [ aTestResult  ].

	 GrowlMorph 
		openWithLabel: title
		contents: contents
		backgroundColor: (self colorForTestResultOf: aTestResult )
		labelColor: Color black