accessing
addATest: aTestCase toACollectionOfMethod: aCollectionOfCompiledMethod
	aCollectionOfCompiledMethod do: [ :aCompiledMethod | self addATest: aTestCase toMethod: aCompiledMethod ]