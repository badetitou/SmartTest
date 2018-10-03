Class {
	#name : #SmTDynamicCoverageStrategyBasicCacheResetEveryCommitTest,
	#superclass : #SmTFinderAbstractTest,
	#category : #'SmartTest-Tests-Finder'
}

{ #category : #running }
SmTDynamicCoverageStrategyBasicCacheResetEveryCommitTest >> initCache [
	^ {((SmTClass >> #method1) asRingDefinition
		->
			{(SmTClassTest >> #testMethod1) asRingDefinition.
			(SmTClassTest >> #testMethod2) asRingDefinition.
			(RGMethodDefinition
				className: 'SmTInheritClassTest'
				selector: #testMethod1
				isMetaSide: false)} asSet).
	((SmTClass >> #method2) asRingDefinition
		-> {(SmTClassTest >> #testMethod2) asRingDefinition} asSet).
	((SmTClass >> #method3:) asRingDefinition
		->
			{(SmTClassTest >> #testMethod1) asRingDefinition.
			(SmTClassTest >> #testMethod2) asRingDefinition.
			(SmTClassTest >> #testMethod3) asRingDefinition} asSet).
	((SmTClass >> #method4) asRingDefinition
		->
			{(SmTClassTest >> #testMethod2) asRingDefinition.
			(SmTClassTest >> #testMethod3) asRingDefinition.
			(SmTClassTest >> #testMethod4) asRingDefinition} asSet).
	((SmTClass2 >> #initialize) asRingDefinition
		-> {(SmTClassTest >> #testMethod5) asRingDefinition} asSet).
	((SmTClassTest >> #testMethod4) asRingDefinition
		-> {(SmTClassTest >> #testMethod4) asRingDefinition} asSet).
	((('SmTP1' , 'Inheritance') asClass >> ('method1' , 'Inheritance') asSymbol)
		asRingDefinition
		->
			{(('SmTP1' , 'InheritanceSubClass1Test') asClass >> ('testMethod1','Inheritance') asSymbol)
				asRingDefinition.
			(RGMethodDefinition className: ('SmTP1InheritanceSubClass2','Test') selector:	('testMethod1','Inheritance') isMetaSide:	false)
				asRingDefinition} asSet)} asDictionary
]

{ #category : #running }
SmTDynamicCoverageStrategyBasicCacheResetEveryCommitTest >> setUp [
	"fill in the cache"

	| initialCache |
	super setUp.
	initialCache := self initCache.
	smartFinder cacheStrategy: (SmTBasicCacheResetEveryCommitStrategy  new).
	smartFinder setCacheValues: initialCache.
	smartFinder smtFinder: SmTTestCoverageTestFinderStrategy new
]

{ #category : #helpers }
SmTDynamicCoverageStrategyBasicCacheResetEveryCommitTest >> tearDown [
	smartFinder resetCache.
]

{ #category : #tests }
SmTDynamicCoverageStrategyBasicCacheResetEveryCommitTest >> testModificationOnTest [
"this method is redundant with the abstract method"
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClassTest >> #testMethod4.
	self deny: (testsFound includes: testMethod1).
	self deny: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod3).
	self assert: (testsFound includes: testMethod4)
]

{ #category : #tests }
SmTDynamicCoverageStrategyBasicCacheResetEveryCommitTest >> testTestSelfSelected [
"this method is redundant with the abstract method"
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestsForATestMethod: SmTClassTest >> #testMethod1.
	self assert: (testsFound includes: testMethod1).
	self deny: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod3).
	self deny: (testsFound includes: testMethod4)
]
