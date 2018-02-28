helpers
setUp
	"fill in the cache"

	| initialCache |
	super setUp.
	initialCache := {((SmTClass >> #method1)
		->
			{(SmTClassTest >> #testMethod1).
			(SmTClassTest >> #testMethod2)} asSet).
	((SmTClass >> #method2) -> {(SmTClassTest >> #testMethod2)} asSet).
	((SmTClass >> #method3:)
		->
			{(SmTClassTest >> #testMethod1).
			(SmTClassTest >> #testMethod2).
			(SmTClassTest >> #testMethod3)} asSet).
	((SmTClass >> #method4)
		->
			{(SmTClassTest >> #testMethod1).
			(SmTClassTest >> #testMethod2).
			(SmTClassTest >> #testMethod3).
			(SmTClassTest >> #testMethod4)} asSet)} asDictionary.
	SmTBasicCacheStrategy new setCache: initialCache