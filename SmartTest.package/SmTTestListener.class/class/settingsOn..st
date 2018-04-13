initialization
settingsOn: aBuilder
	<systemsettings>
	(aBuilder setting: #activated)
		parent: #Beta;
		target: self;
		order: 0.04;
		label: 'AutoUpdate Cache';
		description:
			'When you execute a test, we''''are updating the cache for it execution
	(BETA)'