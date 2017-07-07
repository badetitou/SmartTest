accessing
changeImpactStrategySettingOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #changeImpactStrategy)
		parent: #TestRegression ;
		target: self;
		label: 'Change Impact strategies' ;
		domainValues: CORAChangeImpactStrategy  allSubclasses ;
		description: 'Choose the class to use to define the strategy for test regression selection scheduling.' 