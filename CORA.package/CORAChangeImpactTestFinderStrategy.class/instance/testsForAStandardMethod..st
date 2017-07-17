accessing
testsForAStandardMethod: aCompiledMethod
	^ ((CORAChangeImpactStrategySettings changeImpactStrategy new
		filter:
			(CORAFilterSettings filter new
				packages: {aCompiledMethod};
				yourself);
		modelStrategy: CIPharoModelStrategy new;
		impactOfChange:
			(CORAChangeImpactChange  new
				entity: aCompiledMethod;
				yourself)) collect: [ :change | change impactedEntity ]) select: [ :animpactedEntity | animpactedEntity isTestMethod ]