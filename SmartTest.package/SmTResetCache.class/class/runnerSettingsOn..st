as yet unclassified
runnerSettingsOn: aBuilder
	<systemsettings>
	(aBuilder group: #reset)
		label: 'Reset Cache';
		target: self;
		parent: #TestRegression;
		dialog: [ SimpleButtonMorph new
				target: SmTTestFinderStrategy;
				label: 'Reset SmartTest Cache';
				actionSelector: #resetMethodToTestCache;
				themeChanged;
				yourself ];
		description: 'Reset the cache of SmartTest
		SmTTestFinderStrategy methodToTest'