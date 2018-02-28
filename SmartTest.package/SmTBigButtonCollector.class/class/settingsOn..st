accessing
settingsOn: aBuilder
	<systemsettings>
	(aBuilder setting: #activated)
		parent: 'SmTNG';
		target: self;
		order: 0.01;
		label: 'SmartTest Collect ButtonActivated';
		description: 'Toogle to activate/disable the Big Button'.
	(aBuilder group: #reset)
		label: 'Big Button Reset Cache';
		target: self;
		parent: #SmTNG;
		dialog: [ SimpleButtonMorph new
				target: self;
				label: 'Reset Bg Button SmartTest Cache';
				actionSelector: #reset;
				themeChanged;
				yourself ];
		description:
			'Reset the cache of SmartTest
		SmTTestFinderStrategy methodToTest'