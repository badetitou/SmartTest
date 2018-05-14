execution
decorateTableCell: anItemCellMorph using: aCommandActivator
	anItemCellMorph
		addExtraTool:
			(IconicButton new
				labelGraphic: (Smalltalk iconNamed: #smallWindow);
				color: Color transparent;
				borderColor: Color transparent;
				target: self;
				actionSelector: #execute)