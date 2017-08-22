accessing
activatedSettingOn: aBuilder
	<systemsettings>
	(aBuilder group: #SmTStrategyOption)
		label: 'SmartTest strategy option';
		description: 'General SmartTest strategy settings';
		parent: #TestRegression;
		order: 0.03