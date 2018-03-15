private - search
recursiveSearchForAStandardMethod: aRGMethodDefinition withFilter: aFilter foundMethods: aCollection
	aRGMethodDefinition senders
		reject: [ :aSenderMethod | (aFilter shouldEntityBeFiltered: aSenderMethod) or: [ aCollection includes: aSenderMethod ] ]
		thenDo: [ :aSenderRGMethodDefinition | 
			aCollection add: aSenderRGMethodDefinition.
			self recursiveSearchForAStandardMethod: aSenderRGMethodDefinition withFilter: aFilter foundMethods: aCollection ]