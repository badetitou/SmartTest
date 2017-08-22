accessing
activatedSettingOn: aBuilder
	<systemsettings>
	(aBuilder setting: #activated)
		parent: 'TestRegression';
		target: SmTRules;
		order: 0.01;
		label: 'SmartTest Reneraku Integration Activated';
		description: 'Toogle to activate/disable the reneraku integration of the plugin'.
	(aBuilder group: #TestRegressionActivation)
		label: 'SmartTest activation option';
		description: 'General SmartTest activation settings';
		parent: #TestRegression;
		order: 0.02