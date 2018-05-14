testMethod2
testMethod2SecondLevelSendersInsidePackageWithTestInside
"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
	^ ('SmTClass','P1') asClass new method2SecondLevelSendersInsidePackageWithTestInside.