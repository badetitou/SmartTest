settings
settingsOn: aBuilder
	<systemsettings>
	(aBuilder group: #reset)
		label: 'Reset Cache';
		target: self;
		parent: #SmartTest;
		dialog: [ SimpleButtonMorph new
				target: SmTTestFinderStrategy;
				label: 'Reset Current SmartTest Cache';
				actionSelector: #resetMethodToTestCache;
				themeChanged;
				yourself ];
		description:
			'Reset the cache of SmartTest
		SmTTestFinderStrategy methodToTest'