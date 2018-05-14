settings
settingsOn: aBuilder
	<systemsettings>
	(aBuilder setting: #packagesRegex)
		label: 'SmartTest filter Regex configuration';
		target: self;
		parent: #SmTFilter;
		ghostHelp: 'SmartTe|Start*Wars';
		notInStyle;
		default: '';
		description:
			'Change the value to scope the package you want to explore.
If you want to check the packages are well detected,run 
	SmTFilterSpecifyPackageSettings selectedPackage'