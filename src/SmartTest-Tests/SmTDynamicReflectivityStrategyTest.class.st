"
A SmTFinderStrategyReflectivityTest is a test class for testing the behavior of SmTFinderStrategyReflectivity
"
Class {
	#name : #SmTDynamicReflectivityStrategyTest,
	#superclass : #SmTFinderAbstractTest,
	#category : 'SmartTest-Tests-Finder'
}

{ #category : #initialization }
SmTDynamicReflectivityStrategyTest >> initCache [
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
			(RGMethodDefinition className: ('SmTP1InheritanceSubClass2','Test') selector:	('testMethod1','Inheritance') asSymbol isMetaSide:	false)} asSet)} asDictionary
]

{ #category : #running }
SmTDynamicReflectivityStrategyTest >> setUp [
	"fill in the cache"

	| initialCache |
	super setUp.
	initialCache := self initCache.
	smartFinder cacheStrategy: SmTBasicCacheStrategy new.
	smartFinder setCacheValues: initialCache.
	smartFinder smtFinder: SmTReflectivityTestFinderStrategy new
]
