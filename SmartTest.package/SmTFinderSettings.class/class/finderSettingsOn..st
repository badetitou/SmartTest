settings-definition
finderSettingsOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #finder)
				label: 'SmartTest finder';
				target: self;
				parent: #SmTStrategyOption;
				domainValues: SmTTestFinderStrategy allSubclasses;
				description: 'The finder defines how CORA searchs the relative test of a method'.