accessing
activatedSettingOn: aBuilder
	<systemsettings>
	(aBuilder setting: #activated)
		parent: #TestRegression;
		target: self;
		label: 'CORA class analyse activated';
		description: 'Toogle to activate/disable the analyse for class'