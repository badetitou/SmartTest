initialization
setList: aTestList
	^ testList
		items: aTestList;
		icons: [ :testMethod | 
			| ib |
			ib := SmTIconFabric createIconForMethod: testMethod.
			self icons add: ib ]