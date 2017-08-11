settings-definition
filterSettingsOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #filter)
				label: 'CORA filter regression testing';
				target: self;
				parent: #CORAStrategyOption;
				domainValues: CIPackagesFilter allSubclasses;
				description: 'If you want to use a Change Impact for finder strategy, you can also use a filter and define it here.
You can also use the default finder strategy and change the filter by another'.