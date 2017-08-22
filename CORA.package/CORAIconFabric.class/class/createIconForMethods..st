creation
createIconForMethods: aTestCollection
	| ib |
	ib := IconicButton new.
	ib
		target: CORARunnerSettings runner;
		actionSelector: #runCases:notifyIcon:;
		arguments:
			{aTestCollection.
			ib};
		labelGraphic:(CORARunnerSettings runner iconForTestFromTestsCasesHistory: aTestCollection) asIcon;
		color: Color transparent;
		borderColor: Color transparent;
		helpText: 'Run the test'.
	^ ib