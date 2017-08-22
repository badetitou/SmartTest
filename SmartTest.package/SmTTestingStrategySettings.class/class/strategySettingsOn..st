accessing
strategySettingsOn: aBuilder
	<systemsettings>
	(aBuilder group: #TestRegression)
		label: 'Test Regression';
		description: 'General Test Regression settings';
		with: [ (aBuilder pickOne: #strategy)
				label: 'SmartTest testing strategy';
				target: self;
				parent: #SmTStrategyOption;
				domainValues: SmTTestingStrategy allSubclasses ;
				description: 'The testing strategy defines when SmartTest will run the test it has found.'.
				]