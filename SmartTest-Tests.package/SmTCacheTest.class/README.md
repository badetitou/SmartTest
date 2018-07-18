This tests are here to assert that cache strategies behave corectly.
- BasicCacheNeverReset should always have something in it.
- BasicCacheResetEvery5Changes should reset after 5 calls to its reset method
- BasicCacheResetEveryCommit should reset after each change that is a commit, and not the methods changes.
- BasicCache should reset each time its method reset is called
