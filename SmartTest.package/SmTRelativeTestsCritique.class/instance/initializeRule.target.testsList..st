initialization
initializeRule: aRule target: anEntity testsList: aTestList
	self initializeRule: aRule target: anEntity.
	tests := aTestList.
	entityModified := (SmTOnModificationStrategy get: self sourceAnchor entity) isNotNil 