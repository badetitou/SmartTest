testing-interest
settingsOn: aBuilder
	<systemsettings>
	(aBuilder setting: #methodActivated)
		parent: #SmTActivationRenrakuOption;
		target: self;
		order: 0.2;
		label: 'SmartTest method analyse activated';
		description: 'Toogle to activate/disable the analyse for method'.
	(aBuilder pickOne: #methodRuleStrategy)
		order: 0.3;
		parent: #SmTActivationRenrakuOption;
		label: 'Method Rule';
		target: self;
		domainValues: SmTMethodTestedRule withAllSubclasses;
		description: 'Select Rule strategy to begin the research of element'