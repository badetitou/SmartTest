initialization
testRunningTestMethod2ToBuildCache
	<CORATestBlacklisted>
	self assert: smartFinder currentCache isEmpty.
	SmTClassTest run: #testMethod2.
	self assert: smartFinder currentCache isNotEmpty.
	self
		assert:
			(smartFinder currentCache
				at: (SmTClass >> #method1 )asRingDefinition)
		equals:
			{(SmTClassTest >> #testMethod2 )asRingDefinition}
				asSet.

	"Not sure about the format of the dictionnary."
	self
		assert:
			(smartFinder currentCache
				at: (SmTClass >> #method2 )asRingDefinition)
		equals:
			{(SmTClassTest >> #testMethod2 )asRingDefinition}
				asSet.
	self
		assert:
			(smartFinder currentCache
				at: (SmTClass >> #method3: )asRingDefinition)
		equals:
			{(SmTClassTest >> #testMethod2 )asRingDefinition}
				asSet.
	self
		assert:
			(smartFinder currentCache
				at: (SmTClass >> #method4 )asRingDefinition)
		equals:
			{(SmTClassTest >> #testMethod2 )asRingDefinition}
				asSet