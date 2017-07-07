as yet unclassified
runnerSettingsOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #runner)
				label: 'CORA runner regression testing';
				target: self;
				parent: #TestRegression;
				domainValues: CORARunnerStrategy allSubclasses;
				description: ''.