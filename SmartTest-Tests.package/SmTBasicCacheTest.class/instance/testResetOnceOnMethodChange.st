tests
testResetOnceOnMethodChange
"Here, the cache should be empty because the BasicCache strategy allows that the reset of the cache"
smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
self assert: (smartFinder currentCache isEmpty)