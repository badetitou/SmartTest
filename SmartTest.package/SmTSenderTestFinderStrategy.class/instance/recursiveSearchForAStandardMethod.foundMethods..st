private - search
recursiveSearchForAStandardMethod: aRGMethodDefinition foundMethods: aCollection
	(self collectSenderOfRGMethodeDefintion: aRGMethodDefinition)
		reject: [ :aSenderMethod | (filter shouldEntityBeFiltered: aSenderMethod) or: [ aCollection includes: aSenderMethod ] ]
		thenDo: [ :aSenderRGMethodDefinition | 
			aCollection add: aSenderRGMethodDefinition.
			self recursiveSearchForAStandardMethod: aSenderRGMethodDefinition foundMethods: aCollection ]