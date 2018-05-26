testMethod1
testMethod1FirstLevelSendersOutsidePackage
	"Data for tests: this method calls directly method1, which is not located in the same package"
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
	^ ('SmTClass','P1') asClass new method1FirstLevelSendersOutsidePackage.