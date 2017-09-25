initialization
initializePresenter
	"Currently useless"

	button
		action:
			[ testList listItems withIndexDo: [ :el :id | (self icons at: id) doButtonAction ] ]