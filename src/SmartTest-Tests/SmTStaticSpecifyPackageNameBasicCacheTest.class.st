"
In this class, the research is limited to the SmartTest-Tests-Data package and the research is static (it is using the SenderStrategy finder).
"
Class {
	#name : #SmTStaticSpecifyPackageNameBasicCacheTest,
	#superclass : #SmTFinderAbstractTest,
	#category : 'SmartTest-Tests-Finder'
}

{ #category : #running }
SmTStaticSpecifyPackageNameBasicCacheTest >> setUp [
	super setUp.
	smartFinder filter: (SmTSpecifyPackagesNameFilter packagesRegex: 'SmartTest-Tests-Data').
	smartFinder resetCache
]

{ #category : #tests }
SmTStaticSpecifyPackageNameBasicCacheTest >> testInheritance [
	<CORATestBlacklisted>
	"The test is outside of the scope of the test"
	| testsFound |
	testsFound := self searchTestMethodsFor: ('SmTP1' , 'Inheritance') asClass >> #method1Inheritance.

	self assert: testsFound isEmpty.
	self deny: (testsFound includes: ((('SmTP1InheritanceSubClass1','Test')asClass >> ('testMethod1','Inheritance')asSymbol) asRingDefinition  )).
	self deny: (testsFound includes: ( (RGMethodDefinition className: ('SmTP1InheritanceSubClass2','Test') selector:	('testMethod1','Inheritance') asSymbol isMetaSide:	false) asRingDefinition  )).
]

{ #category : #tests }
SmTStaticSpecifyPackageNameBasicCacheTest >> testStandardMethodFirstLevelSenders [
	"Same test as in the superclass, but here there should be only one test found (there are many in the superclass)"

	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClass >> #method2.
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod1).
	self deny: (testsFound includes: testMethod3).
	self deny: (testsFound includes: testMethod4)
]

{ #category : #tests }
SmTStaticSpecifyPackageNameBasicCacheTest >> testStandardMethodSecondLevelSenders [
	"In class, the research is limited to the SmartTest-Tests-Data package and is static. So the assertions are different. There should be only one test found that call the method2 message"
	"Here the test founds should not include the test 'testInheritedMethod1' because 
	- it is not in the package SmartTest-Tests-Data 
	- it makes a reference to SmTClassOutSide new method2 and NOT SmTClass >> method2"

	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClass >> #method1.
	self assert: testsFound size equals: 3.
	self assert: (testsFound includes: testMethod1).
	self assert: (testsFound includes: testMethod2).
	self assert: (testsFound includes: testInheritedMethod1).
	self deny: (testsFound includes: testMethod3).
	self deny: (testsFound includes: testMethod4)
]

{ #category : #tests }
SmTStaticSpecifyPackageNameBasicCacheTest >> testStandardMethodThirdLevelSenders [
	<CORATestBlacklisted>
	| testsFound | 
	testsFound := self searchTestMethodsFor: SmTClass >> #method4.
	self assert: testsFound size equals: 3.
	self deny: (testsFound includes: (SmTClassTest  >> #testMethod1  )asRingDefinition).
	self assert: (testsFound includes: (SmTClassTest  >> #testMethod2  )asRingDefinition).
	self assert: (testsFound includes: (SmTClassTest  >> #testMethod3  )asRingDefinition).
	self assert: (testsFound includes: (SmTClassTest  >> #testMethod4  )asRingDefinition).
]
