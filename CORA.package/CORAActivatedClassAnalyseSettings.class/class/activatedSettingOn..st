accessing
activatedSettingOn: aBuilder
	<systemsettings>
	(aBuilder setting: #activated)
		parent: #TestRegressionActivation;
		target: self;
		order: 0.1;
		label: 'CORA class analyse activated';
		description: 'Toogle to activate/disable the analyse for class'.