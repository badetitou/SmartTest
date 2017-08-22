table decoration
decorateTableCell: anItemCellMorph using: aCommandActivator

	| button |
	button := CORAIconFabric createIconForMethods: critique tests.
		
	self decorateTableCell: anItemCellMorph with: button