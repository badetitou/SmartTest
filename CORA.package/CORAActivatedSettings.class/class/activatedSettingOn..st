accessing
activatedSettingOn: aBuilder
	<systemsettings>
	(aBuilder setting: #activated)
		parent: #TestRegression;
		target: CORARules;
		label: 'CORA Activated';
		description: 'Toogle to activate/disable the plugin'