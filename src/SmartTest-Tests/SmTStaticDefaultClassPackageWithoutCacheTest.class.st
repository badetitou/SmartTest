"
In this class, the research is limited to the SmartTest-Tests-Data package, the research is static (it is using the SenderStrategy finder) and no cache is used.

This comment is false, the research is not limited to SmartTest-Tests-Data package ! Should we change the comment or the tests ??
"
Class {
	#name : #SmTStaticDefaultClassPackageWithoutCacheTest,
	#superclass : #SmTFinderAbstractTest,
	#category : 'SmartTest-Tests-Finder'
}

{ #category : #running }
SmTStaticDefaultClassPackageWithoutCacheTest >> setUp [
	super setUp.
	smartFinder cacheStrategy: SmTNoCacheStrategy new.
	cache := SmTNoCacheStrategy new
]

{ #category : #initialization }
SmTStaticDefaultClassPackageWithoutCacheTest >> tearDown [
	super tearDown.
	smartFinder resetCache
]
