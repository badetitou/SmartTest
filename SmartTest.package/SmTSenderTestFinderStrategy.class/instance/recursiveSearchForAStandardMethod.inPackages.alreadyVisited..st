private - search
recursiveSearchForAStandardMethod: aRGMethodDefinition inPackages: packages alreadyVisited: alreadyVisitedMethods
	| foundMethods |
	foundMethods := OrderedCollection new.
	(self collectSenderOfRGMethodeDefintion: aRGMethodDefinition)
		reject: [ :aSenderMethod | 
			| reject |
			reject := (filter shouldEntityBeFiltered: aSenderMethod inPackages: packages) or: [ alreadyVisitedMethods includes: aSenderMethod ].
			alreadyVisitedMethods add: aSenderMethod.
			reject ]
		thenDo: [ :aSenderRGMethodDefinition | 
			foundMethods add: aSenderRGMethodDefinition.
			foundMethods addAll: (self recursiveSearchForAStandardMethod: aSenderRGMethodDefinition inPackages: packages alreadyVisited: alreadyVisitedMethods) ].
	^ foundMethods