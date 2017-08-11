settings-definition
finderSettingsOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #finder)
				label: 'CORA finder';
				target: self;
				parent: #CORAStrategyOption;
				domainValues: CORATestFinderStrategy allSubclasses;
				description: 'The finder defines how CORA searchs the relative test of a method'.