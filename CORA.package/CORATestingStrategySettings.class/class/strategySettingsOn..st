accessing
strategySettingsOn: aBuilder
	<systemsettings>
	(aBuilder group: #TestRegression)
		label: 'Test Regression';
		description: 'General Test Regression settings';
		with: [ (aBuilder pickOne: #strategy)
				label: 'CORA testing strategy';
				target: self;
				parent: #TestRegression;
				domainValues: CORATestingStrategy allSubclasses ;
				description: 'If true, then CORA will autotest method show you the result'.
				]