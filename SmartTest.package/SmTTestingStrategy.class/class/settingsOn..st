protocol
settingsOn: aBuilder
	<systemsettings>
	(aBuilder group: #TestingStrategy)
	order: 1.5;
		parent: #SmartFinder;
		with: [ (aBuilder setting: #defaultSizeOfResearchQueue)
				target: self;
				parent: #TestingStrategy;
				label: 'Size of the queue for the research of element';
				description: '' ]