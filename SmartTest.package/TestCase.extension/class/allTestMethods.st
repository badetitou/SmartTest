*SmartTest
allTestMethods
	^ self  methods select: [:aCompiledMethod| 
							   aCompiledMethod isTestMethod].