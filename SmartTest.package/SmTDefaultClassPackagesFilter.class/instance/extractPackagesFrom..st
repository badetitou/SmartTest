accessing
extractPackagesFrom: aCollectionOfCompiledMethod
	super
		extractPackagesFrom:
			((aCollectionOfCompiledMethod collect: #methodClass) flatCollect: [ :aClass | aClass allCallsOn collect: #compiledMethod ])
				, (aCollectionOfCompiledMethod collect: #package) asOrderedCollection