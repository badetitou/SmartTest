as yet unclassified
runnerSettingsOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #runner)
				label: 'SmartTest test runner';
				target: self;
				parent: #SmTStrategyOption;
				domainValues: SmTRunnerStrategy allSubclasses;
				description: 'The test runner defines if the tests are run in a debug way or not'.