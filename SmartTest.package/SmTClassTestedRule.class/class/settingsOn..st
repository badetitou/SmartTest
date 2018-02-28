testing-interest
settingsOn: aBuilder
	<systemsettings>
	(aBuilder setting: #activated)
		parent: #SmTActivationRenrakuOption;
		target: self;
		order: 0.1;
		label: 'SmartTest class analyse activated';
		description: 'Toogle to activate/disable the analyse for class'