settings
settingsOn: aBuilder
	<systemsettings>
	(aBuilder group: #SmartTest)
		with: [ (aBuilder group: #SmartFinder)
				with: [ (aBuilder pickOne: #finder)
						label: 'SmartTest finder';
						target: self;
						parent: #SmartFinder;
						domainValues: (SmTTestFinderStrategy allSubclasses select: #isConcreteFinder);
						description: 'The finder defines how CORA searchs the relative test of a method'.
					(aBuilder pickOne: #cacheClass)
						label: 'SmartTest Cache';
						target: self;
						parent: #SmartFinder;
						domainValues: SmTCacheStrategy allSubclasses;
						description:
							'To visualize the current cache
				SmTCacheSettings cache new currentCache'.
					(aBuilder pickOne: #runner)
						label: 'SmartTest test runner';
						target: self;
						parent: #SmartFinder;
						domainValues: SmTRunnerStrategy allSubclasses;
						description: 'The test runner defines if the tests are run in a debug way or not'.
					(aBuilder pickOne: #strategy)
						label: 'SmartTest testing strategy';
						target: self;
						parent: #SmartFinder;
						domainValues: SmTTestingStrategy allSubclasses;
						description: 'The testing strategy defines when SmartTest will run the test it has found.'.
					(aBuilder pickOne: #filter)
						label: 'SmartTest filter';
						target: self;
						parent: #SmartFinder;
						domainValues: SmTDefaultPackagesFilter withAllSubclasses;
						description: 'The testing strategy defines when SmartTest will run the test it has found.' ].
			(aBuilder group: #SmTActivationRenrakuOption)
				with: [ (aBuilder setting: #activated)
						target: self;
						order: 0.01;
						label: 'SmartTest Reneraku Integration Activated';
						description: 'Toogle to activate/disable the reneraku integration of the plugin' ].
			(aBuilder setting: #shouldTryToFindTestForDynamic)
				parent: 'SmartTest';
				target: self;
				order: 0.04;
				label: 'Try to find for Dynamic ';
				description:
					'When you click in a method, and have selected a Dynamix finder, we''''are updating the cache for it execution
	(BETA)'.
			(aBuilder group: #reset)
				label: 'Fill cache';
				target: self;
				parent: #SmartTest;
				dialog: [ SimpleButtonMorph new
						target: self;
						label: 'Fill cache';
						actionSelector: #fillCache;
						themeChanged;
						yourself ];
				description: 'Fill the cache with selected package' ]