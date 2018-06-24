accessing
settingsOn: aBuilder
	<systemsettings>
	(aBuilder setting: #activated)
		parent: 'SmartTest';
		target: self;
		order: 0.01;
		label: 'SmartTest Collect Button';
		description: 'Toogle to activate/disable the Big Button'.
	(aBuilder group: #reset)
		label: 'Big Button Reset Cache';
		target: self;
		parent: #SmartTest;
		order: 8;
		dialog: [ SimpleButtonMorph new
				target: self;
				label: 'Reset Collect Button Cache';
				actionSelector: #reset;
				themeChanged;
				yourself ];
		description:
			'Reset the cache of SmartTest
		SmTTestFinderStrategy methodToTest'