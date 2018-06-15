table decoration
decorateTableCell: anItemCellMorph using: aCommandActivator

	| button |
	(self canBeExecutedInContext: critique) ifFalse: [ ^ self ].
	button := SmTIconFabric createIconForMethods: critique tests.
		
	self decorateTableCell: anItemCellMorph with: button