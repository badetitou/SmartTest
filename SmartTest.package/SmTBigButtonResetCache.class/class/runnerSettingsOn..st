as yet unclassified
runnerSettingsOn: aBuilder
	<systemsettings>
	(aBuilder group: #reset)
		label: 'Big Button Reset Cache';
		target: self;
		parent: #TestRegression;
		dialog: [ SimpleButtonMorph new
				target: self;
				label: 'Reset Bg Button SmartTest Cache';
				actionSelector: #reset;
				themeChanged;
				yourself ];
		description: 'Reset the cache of SmartTest
		SmTTestFinderStrategy methodToTest'