initialization
testStandardMethodSecondLevelSenders
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