accessing
activatedSettingOn: aBuilder
	<systemsettings>
	(aBuilder setting: #activated)
		parent: 'TestRegression';
		target: CORARules;
		order: 0.01;
		label: 'CORA Reneraku Integration Activated';
		description: 'Toogle to activate/disable the reneraku integration of the plugin'.
	(aBuilder group: #TestRegressionActivation)
		label: 'CORA activation option';
		description: 'General CORA activation settings';
		parent: #TestRegression;
		order: 0.02