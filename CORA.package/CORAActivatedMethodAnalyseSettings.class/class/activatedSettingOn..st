accessing
activatedSettingOn: aBuilder
	<systemsettings>
	(aBuilder setting: #activated)
		parent: #TestRegressionActivation;
		target: self;
		order: 0.2;
		label: 'CORA method analyse activated';
		description: 'Toogle to activate/disable the analyse for method'