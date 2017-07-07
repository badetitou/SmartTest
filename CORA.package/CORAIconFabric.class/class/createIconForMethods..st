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
		labelGraphic: #testNotRun asIcon;
		color: Color transparent;
		borderColor: Color transparent;
		helpText: 'Run the test'.	
	^ ib