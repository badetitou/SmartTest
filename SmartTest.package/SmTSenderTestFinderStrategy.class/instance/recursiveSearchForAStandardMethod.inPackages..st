private - search
recursiveSearchForAStandardMethod: aRGMethodDefinition inPackages: packages
	| foundMethods |
	foundMethods := OrderedCollection new.
	(self collectSenderOfRGMethodeDefintion: aRGMethodDefinition)
		reject: [ :aSenderMethod | 
			(filter shouldEntityBeFiltered: aSenderMethod inPackages: packages )
				or: [ foundMethods includes: aSenderMethod ] ]
		thenDo: [ :aSenderRGMethodDefinition | 
			foundMethods add: aSenderRGMethodDefinition.
			foundMethods addAll: (self
				recursiveSearchForAStandardMethod: aSenderRGMethodDefinition
				inPackages: packages) ].
	^ foundMethods