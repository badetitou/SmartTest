testMethod1
testMethod1FirstLevelSendersInsidePackage
"Data for tests: this method calls directly a method from the same package."
"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
	^ ('SmTClass','P1') asClass new method1FirstLevelSendersInsidePackage.