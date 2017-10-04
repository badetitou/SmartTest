initialization
initializeWidgets
	testList := IconListModel new.
	button := self newButton.
	button label: 'Run all test'.
	self focusOrder add: testList.
	
