accessing
activatedSettingOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #changeImpactStrategy)
		parent: #CORAStrategyOption ;
		target: self;
		label: 'Change Impact strategies' ;
		domainValues: CORAChangeImpactStrategy  allSubclasses ;
		description: 'Choose the class to use to define the strategy for test regression selection scheduling.' 