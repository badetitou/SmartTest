"
Represent a dynamic strategy

self todo: #AddDetails
"
Class {
	#name : #SmTTestFinderDynamicStrategy,
	#superclass : #SmTTestFinderStrategy,
	#instVars : [
		'currentTestExecution'
	],
	#category : #'SmartTest-Finder'
}

{ #category : #testing }
SmTTestFinderDynamicStrategy class >> isConcreteFinder [
	^ false
]

{ #category : #api }
SmTTestFinderDynamicStrategy >> addATest: aTestCase toMethod: aCompiledMethod [
	(self searchTestsForMethod: aCompiledMethod)
		add: aTestCase methodReference
]

{ #category : #api }
SmTTestFinderDynamicStrategy >> analyseAndRemoveProxyFor: aTestCase [
	self subclassResponsibility
]

{ #category : #api }
SmTTestFinderDynamicStrategy >> buildCacheFromTestSuite: aTestSuite [
	self subclassResponsibility
]

{ #category : #accessing }
SmTTestFinderDynamicStrategy >> currentTestExecution [
	^ currentTestExecution
]

{ #category : #accessing }
SmTTestFinderDynamicStrategy >> currentTestExecution: anObject [
	currentTestExecution := anObject
]

{ #category : #api }
SmTTestFinderDynamicStrategy >> installProxyFor: aTestCase [
	self subclassResponsibility
]

{ #category : #api }
SmTTestFinderDynamicStrategy >> methodsFor: aCompiledMethod [
	| finalFoundMethod |
	^ self cache
		at: aCompiledMethod methodReference
		ifAbsent: [  (self shouldTryToFindTestForDynamic )
				ifFalse: [ ^ {} ].
			#(#searchTestsForATestMethod: #searchTestsForASetUpMethod: #searchTestsForATearDownMethod: #searchTestsForAStandardMethod:)
				do: [ :heuristic | 
					| methods |
					methods := [ self perform: heuristic with: aCompiledMethod ]
						on: MessageNotUnderstood
						do: [ #() ].
					methods isEmpty
						ifFalse: [ finalFoundMethod := self searchTestsForMethod: aCompiledMethod.
							finalFoundMethod addAll: (self computeInheritedTestFromDiscoveredTest: methods) asOrderedCollection.
							^ finalFoundMethod ] ].
			self cache at: aCompiledMethod methodReference put: Set new.
			^ {} ]
]
