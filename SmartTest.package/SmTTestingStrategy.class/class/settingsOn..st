protocol
settingsOn: aBuilder
	<systemsettings>
	(aBuilder group: #TestingStrategy)
	parent: #SmartTest;
		with: [ (aBuilder setting: #defaultSizeOfResearchQueue)
				target: self;
				parent: #TestingStrategy;
				label: 'Size of the queue for the research of element';
				description: 'Size of the queue for the research of element.' ]