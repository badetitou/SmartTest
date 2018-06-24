testMethod1
testMethod1FirstLevelSendersOutsideWithRefInPackage	
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
^('SmTClassP1','FirstLevelSendersOutsideWithRefInPackage') asClass new method1FirstLevelSendersWithRefInPackage.