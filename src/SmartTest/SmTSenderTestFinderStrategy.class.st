"
I work as ChangeImpact.
I'm looking for sender of sender etc.
I'm not well tested, but I'm fast and can help you for quick testing.
"
Class {
	#name : #SmTSenderTestFinderStrategy,
	#superclass : #SmTTestFinderStrategy,
	#category : #'SmartTest-Finder'
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

{ #category : #'private - search' }
SmTSenderTestFinderStrategy >> recursiveSearchForAStandardMethod: aRGMethodDefinition inPackages: packages [
	^ self recursiveSearchForAStandardMethod: aRGMethodDefinition inPackages: packages alreadyVisited: Set new
]

{ #category : #'private - search' }
SmTSenderTestFinderStrategy >> recursiveSearchForAStandardMethod: aRGMethodDefinition inPackages: packages alreadyVisited: alreadyVisitedMethods [
	^ self recursiveSearchForAStandardMethod: aRGMethodDefinition inPackages: packages alreadyVisited: alreadyVisitedMethods withDepthLimit: self researchDepthLimit
]

{ #category : #'private - search' }
SmTSenderTestFinderStrategy >> recursiveSearchForAStandardMethod: aRGMethodDefinition inPackages: packages alreadyVisited: alreadyVisitedMethods withDepthLimit: aDepthLimit [
	| foundMethods |
	"case we have already do the reasearch for this method"
	self cache at: aRGMethodDefinition ifPresent: [ :a | ^ a ].
	"case the research is too long"
	(aDepthLimit = 0) ifTrue: [ ^ Set new ].
	"recursive case"
	foundMethods := Set new.
	(self collectSenderOfRGMethodeDefintion: aRGMethodDefinition)
		reject: [ :aSenderMethod | 
			| reject |
			reject := (filter shouldEntityBeFilteredOut: aSenderMethod inPackages: packages) or: [ alreadyVisitedMethods includes: aSenderMethod ].
			alreadyVisitedMethods add: aSenderMethod.
			reject ]
		thenDo: [ :aSenderRGMethodDefinition | 
			foundMethods add: aSenderRGMethodDefinition.
			foundMethods addAll: (self recursiveSearchForAStandardMethod: aSenderRGMethodDefinition inPackages: packages alreadyVisited: alreadyVisitedMethods withDepthLimit: aDepthLimit -1) ].
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
