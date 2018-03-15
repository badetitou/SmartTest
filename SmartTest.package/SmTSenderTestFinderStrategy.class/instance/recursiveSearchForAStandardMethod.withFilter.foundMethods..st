private - search
recursiveSearchForAStandardMethod: aRGMethodDefinition withFilter: aFilter foundMethods: aCollection
	| filteredSenderMethods |
	filteredSenderMethods := aRGMethodDefinition senders
		reject: [ :aSenderMethod | (aFilter shouldEntityBeFiltered: aSenderMethod) or: [ aCollection includes: aSenderMethod ] ].
	filteredSenderMethods
		do: [ :aSenderRGMethodDefinition | 
			aCollection add: aSenderRGMethodDefinition.
			self recursiveSearchForAStandardMethod: aSenderRGMethodDefinition withFilter: aFilter foundMethods: aCollection ]