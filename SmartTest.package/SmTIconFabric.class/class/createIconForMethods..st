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
		labelGraphic:(SmTRules runner iconForTestFromTestsCasesHistory: aTestCollection) asIcon;
		color: Color transparent;
		borderColor: Color transparent;
		helpText: 'Run the test'.
	^ ib