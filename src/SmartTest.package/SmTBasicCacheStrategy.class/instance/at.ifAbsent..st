accessing
at: methodReference ifAbsent: aBlock
	^ self currentCache at: methodReference ifAbsent: aBlock