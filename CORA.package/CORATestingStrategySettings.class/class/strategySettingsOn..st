accessing
strategySettingsOn: aBuilder
	<systemsettings>
	(aBuilder group: #TestRegression)
		label: 'Test Regression';
		description: 'General Test Regression settings';
		with: [ (aBuilder pickOne: #strategy)
				label: 'CORA testing strategy';
				target: self;
				parent: #CORAStrategyOption;
				domainValues: CORATestingStrategy allSubclasses ;
				description: 'The testing strategy defines when CORA will run the test it has found.'.
				]