initialization
testStandardMethodSecondLevelSenders
	"In class, the research is limited to the SmartTest-Tests-Data package and is static. So the assertions are different. There should be only one test found that call the method2 message"

	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClass >> #method1.
	self assert: testsFound size equals: 2.
	self assert: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest' selector: #testMethod1 isMetaSide: false)).
	self assert: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest' selector: #testMethod2 isMetaSide: false)).
	self deny: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest' selector: #testMethod3 isMetaSide: false)).
	self deny: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest' selector: #testMethod4 isMetaSide: false))