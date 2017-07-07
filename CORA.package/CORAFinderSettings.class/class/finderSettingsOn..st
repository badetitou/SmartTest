settings-definition
finderSettingsOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #finder)
				label: 'CORA finder regression testing';
				target: self;
				parent: #TestRegression;
				domainValues: CORAFinderStrategy allSubclasses;
				description: ''.