"
I work as ChangeImpact.
I'm looking for sender of sender etc.
I'm not well tested, but I'm fast and can help you for quick testing.
"
Class {
	#name : #SmTSenderTestFinderStrategy,
	#superclass : #SmTTestFinderStrategy,
	#category : 'SmartTest-Finder'
}

{ #category : #testing }
SmTSenderTestFinderStrategy class >> isConcreteFinder [
	^ true
]

{ #category : #'private - search' }
SmTSenderTestFinderStrategy >> collectSenderOfRGMethodeDefintion: aRGMethodDefinition [
	^ aRGMethodDefinition isInitializer
		ifTrue: [ { SystemNavigation default allReferencesTo: aRGMethodDefinition methodClass binding.
			aRGMethodDefinition senders} asSet flattened  ]
		ifFalse: [ aRGMethodDefinition senders ]
]

{ #category : #api }
SmTSenderTestFinderStrategy >> methodsFor: aCompiledMethod forThePackage: packages [
	self flag: '24 july 2018 - What is this method ? If useless i or from another project i will remove it'.

	^ self cache
		at: aCompiledMethod methodReference
		ifAbsent: [ (self searchTestsForATestMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self searchTestsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			(self searchTestsForASetUpMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self searchTestsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			(self searchTestsForATearDownMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self searchTestsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			(self recursiveSearchForAStandardMethod: (aCompiledMethod asRingDefinition)  inPackages: packages )
				ifNotEmpty: [ :methods | 
					^ (self searchTestsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			self cache at: aCompiledMethod methodReference put: Set new.
			^ {} ]
]

{ #category : #'private - search' }
SmTSenderTestFinderStrategy >> recursiveSearchForAStandardMethod: aRGMethodDefinition inPackages: packages [
	^ self recursiveSearchForAStandardMethod: aRGMethodDefinition inPackages: packages alreadyVisited: Set new
]

{ #category : #'private - search' }
SmTSenderTestFinderStrategy >> recursiveSearchForAStandardMethod: aRGMethodDefinition inPackages: packages alreadyVisited: alreadyVisitedMethods [
	| foundMethods |
	self cache at: aRGMethodDefinition ifPresent: [ :a | ^ a ].
	foundMethods := Set new.
	(self collectSenderOfRGMethodeDefintion: aRGMethodDefinition)
		reject: [ :aSenderMethod | 
			| reject |
			reject := (filter shouldEntityBeFilteredOut: aSenderMethod inPackages: packages) or: [ alreadyVisitedMethods includes: aSenderMethod ].
			alreadyVisitedMethods add: aSenderMethod.
			reject ]
		thenDo: [ :aSenderRGMethodDefinition | 
			foundMethods add: aSenderRGMethodDefinition.
			foundMethods addAll: (self recursiveSearchForAStandardMethod: aSenderRGMethodDefinition inPackages: packages alreadyVisited: alreadyVisitedMethods) ].
	^ foundMethods
]

{ #category : #API }
SmTSenderTestFinderStrategy >> searchTestsForAStandardMethod: aCompiledMethod [
	| packagesToLookAt |
	packagesToLookAt := self filter extractPackagesFrom: aCompiledMethod.
	^ (self
		recursiveSearchForAStandardMethod: aCompiledMethod methodReference
		inPackages: packagesToLookAt ) select: #isTestMethod
]
