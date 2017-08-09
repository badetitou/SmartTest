accessing
activatedSettingOn: aBuilder
	<systemsettings>
	(aBuilder setting: #activated)
		parent: #TestRegression;
		target: self;
		label: 'CORA method analyse activated';
		description: 'Toogle to activate/disable the analyse for method'