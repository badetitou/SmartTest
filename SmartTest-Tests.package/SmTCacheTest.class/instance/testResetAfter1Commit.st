tests
testResetAfter1Commit
"After one method change, the cache should be empty for NeverRest, EveryFiveChange, and EveryCommit case."
smartFinder cacheStrategy resetCacheForChange: EpMonticelloVersionSave new.
self assert: (smartFinder currentCache isNotEmpty)