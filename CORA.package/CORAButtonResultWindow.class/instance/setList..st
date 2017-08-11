initialization
setList: aTestList
	^ testList
		items: aTestList;
		icons: [ :testMethod | 
			| ib |
			ib := CORAIconFabric createIconForMethod: testMethod.
			self icons add: ib ]