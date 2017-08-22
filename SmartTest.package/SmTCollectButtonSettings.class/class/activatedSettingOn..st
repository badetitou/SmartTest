accessing
activatedSettingOn: aBuilder
	<systemsettings>
	(aBuilder setting: #activated)
		parent: 'TestRegression';
		target: self;
		order: 0.01;
		label: 'SmartTest Collect ButtonActivated';
		description: 'Toogle to activate/disable the Big Button'.