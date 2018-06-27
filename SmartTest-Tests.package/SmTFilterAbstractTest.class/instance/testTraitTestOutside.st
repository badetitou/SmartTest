test - extension method
testTraitTestOutside
	<CORATestBlacklisted>
	| testsFound |
	testsFound := smartFinder smtFinder searchTestsForATrait: SmTTraitInside.
	self deny: (testsFound includes: ((('SmT','TraitOutsideTest') asClass >> ('testTraitMethod1','Outside') asSymbol) asRingDefinition )).

	