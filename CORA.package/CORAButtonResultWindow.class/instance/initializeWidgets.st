accessing
initializeWidgets
	testList := IconListModel new.
	button := (ProgressCircle new
		controler: self;
		percentage: 100;
		extent: 400@200;
		color: Color gray) asSpecAdapter.

	self focusOrder add: testList.