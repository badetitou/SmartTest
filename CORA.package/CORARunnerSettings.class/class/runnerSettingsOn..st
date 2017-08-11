as yet unclassified
runnerSettingsOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #runner)
				label: 'CORA test runner';
				target: self;
				parent: #CORAStrategyOption;
				domainValues: CORARunnerStrategy allSubclasses;
				description: 'The test runner defines if the tests are run in a debug way or not'.