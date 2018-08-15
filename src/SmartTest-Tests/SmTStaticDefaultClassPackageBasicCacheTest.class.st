"
I test the static finder with DefaultClassPackageFilter and BasicCache
"
Class {
	#name : #SmTStaticDefaultClassPackageBasicCacheTest,
	#superclass : #SmTFinderAbstractTest,
	#category : 'SmartTest-Tests-Finder'
}

{ #category : #running }
SmTStaticDefaultClassPackageBasicCacheTest >> setUp [
	super setUp.
	smartFinder resetCache
]

{ #category : #tests }
SmTStaticDefaultClassPackageBasicCacheTest >> testStandardMethodSecondLevelSenders [
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClass >> #method1.
	
	self assert: (testsFound includes: testMethod1).
	self assert: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod3).
	self deny: (testsFound includes: testMethod4).
]
