accessing
filter: aCollectionOfCompiledMethod
	^aCollectionOfCompiledMethod select: [ :aCompiledMethod | self filter shouldEntityBeFiltered: aCompiledMethod ]