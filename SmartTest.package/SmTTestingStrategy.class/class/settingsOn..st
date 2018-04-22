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
				description: 'SmartTest has a queue to keep a list of all the research it has to do.
But not launch them directly.
This is important to not freeze the image quickly.' ]