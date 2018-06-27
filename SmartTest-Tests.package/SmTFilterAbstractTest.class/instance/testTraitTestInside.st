test - extension method
testTraitTestInside
	<CORATestBlacklisted>
	| testsFound |
	testsFound := smartFinder smtFinder searchTestsForATrait: SmTTraitInside.
	self assert: (testsFound includes: ((('SmT','TraitInsideTest') asClass >> ('testTraitMethod1','Inside') asSymbol) asRingDefinition )).

	