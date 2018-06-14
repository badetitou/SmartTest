creation
createIconForMethods: aTestCollection
	| ib |
	ib := IconicButton new.
	ib
		target: SmTRules runner;
		actionSelector: #runCases:notifyIcon:;
		arguments:
			{aTestCollection.
			ib};
		labelGraphic:
			(self
				iconNamed: (SmTRules runner iconForTestFromTestsCasesHistory: aTestCollection));
		color: Color transparent;
		borderColor: Color transparent;
		helpText: 'Run the test'.
	^ ib