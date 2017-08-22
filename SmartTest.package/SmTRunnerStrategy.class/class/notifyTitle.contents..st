action
notifyTitle: title contents: aTestResult

	 GrowlMorph 
		openWithLabel: title
		contents: (aTestResult tests)
		backgroundColor: (self colorForTestResultOf: aTestResult )
		labelColor: Color black