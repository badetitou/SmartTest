accessing
testsForAStandardMethod: aCompiledMethod
	^ (((SmTChangeImpactStrategySettings changeImpactStrategy new
		filter:
			(SmTFilterSettings filter new
				packages: {aCompiledMethod};
				yourself);
		modelStrategy: CIPharoModelStrategy new;
		impactOfChange:
			(SmTChangeImpactChange  new
				entity: aCompiledMethod;
				yourself)) collect: [ :change | change impactedEntity ]) select: [ :animpactedEntity | animpactedEntity isTestMethod ]) collect: #methodReference