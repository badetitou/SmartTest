testMethod2
testMethod2SecondLevelSendersOutsidePackageWithTestInside
"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
	^ ('SmTClass','P2') asClass new method2SecondLevelSendersOutsidePackageWithTestInside.