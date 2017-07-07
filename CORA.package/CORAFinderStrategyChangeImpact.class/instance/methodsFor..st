accessing
methodsFor: aCompiledMethod
	#( 	testsForATestMethod: 
		testsForASetUpMethod: 
		testsForATearDownMethod:
		testsForAStandardMethod:
		testsForClassReferenceOf:) do: 
			[:heuristic | |methods|
			methods := self perform: heuristic with: aCompiledMethod.
			methods isEmpty ifFalse: [^ methods asOrderedCollection]].
	^ {}.