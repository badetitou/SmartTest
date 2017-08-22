creation
createIconForMethods: aTestCollection
	| ib |
	ib := IconicButton new.
	ib
		target: SmTRunnerSettings runner;
		actionSelector: #runCases:notifyIcon:;
		arguments:
			{aTestCollection.
			ib};
		labelGraphic:(SmTRunnerSettings runner iconForTestFromTestsCasesHistory: aTestCollection) asIcon;
		color: Color transparent;
		borderColor: Color transparent;
		helpText: 'Run the test'.
	^ ib