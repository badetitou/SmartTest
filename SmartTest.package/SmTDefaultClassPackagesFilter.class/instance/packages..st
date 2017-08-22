accessing
packages: aCollectionOfCompiledMethod
	super
		packages:
			((aCollectionOfCompiledMethod collect: #methodClass) flatCollect: [ :aClass | aClass allCallsOn collect: #compiledMethod ])
				, (aCollectionOfCompiledMethod collect: #package) asOrderedCollection