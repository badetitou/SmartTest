accessing
activatedSettingOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #changeImpactStrategy)
		parent: #SmTStrategyOption ;
		target: self;
		label: 'Change Impact strategies' ;
		domainValues: SmTChangeImpactStrategy  allSubclasses ;
		description: 'Choose the class to use to define the strategy for test regression selection scheduling.' 