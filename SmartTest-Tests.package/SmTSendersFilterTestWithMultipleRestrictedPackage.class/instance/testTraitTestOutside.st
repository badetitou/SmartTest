test - extension method
testTraitTestOutside 
"Should not find the test as it is outside of the scope of the finder"
	<CORATestBlacklisted>
	| testsFound |
	testsFound := smartFinder smtFinder searchTestsForATrait: SmTTraitInside.
	self assert: (testsFound includes: ((('SmT','TraitOutsideTest') asClass >> ('testTraitMethod1','Outside') asSymbol) asRingDefinition )).

	