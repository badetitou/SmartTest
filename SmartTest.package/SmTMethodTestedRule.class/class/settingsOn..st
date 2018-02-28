testing-interest
settingsOn: aBuilder
	<systemsettings>
	(aBuilder setting: #methodActivated)
		parent: #SmTActivationRenrakuOption;
		target: self;
		order: 0.2;
		label: 'SmartTest method analyse activated';
		description: 'Toogle to activate/disable the analyse for method'