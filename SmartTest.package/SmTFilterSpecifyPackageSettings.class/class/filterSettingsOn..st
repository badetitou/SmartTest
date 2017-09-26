settings-definition
filterSettingsOn: aBuilder
	<systemsettings>
	(aBuilder setting: #packagesRegEx)
		label: 'SmartTest filter RegEx configuration';
		target: self;
		parent: #SmTStrategyOption;
		ghostHelp: 'SmartTe,Start*Wars';
		notInStyle;
		default: '';
		description:
			'Change the value to scope the package you want to explore.
If you want to check the packages are well detected,run 
	SmTFilterSpecifyPackageSettings selectedPackage'