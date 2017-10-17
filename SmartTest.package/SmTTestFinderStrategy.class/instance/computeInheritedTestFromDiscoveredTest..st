accessing
computeInheritedTestFromDiscoveredTest: aCollectionOfRGDefinitionOfTest
	| testList |
	testList := OrderedCollection new.
	aCollectionOfRGDefinitionOfTest
		do: [ :anRGDefinition | 
			anRGDefinition methodClass isAbstract
				ifTrue: [ testList addAll: (self subTestFromRGDefinition: anRGDefinition) ]
				ifFalse: [ testList add: anRGDefinition ] ].
	^ testList asSet 