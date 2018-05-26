I test the strategy SendersFinder with different filters.
In order to be sure that those test are not considered as callers of the modified method and as references to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method.


The tests are described below:
The modified method’s name always contains « method1 » and will be refered to as method1.
The modified method can be used directly by a test, in this case the test’s name contains « testMethod1 » 
The modified method can be used by a method (and then a test), then the method’s name contains « method2 »
Method 2 will then be called by a test (the second level sender of method1) and this test's name contains « testMethod2 »
The names of the methods and tests will be followed by a identificator. This will result in very long names but it is necessary in order to be unique and explicit.
Being unique, the senders of each method are controlled and consequently the tests are independent the one from the others.

If the name of a test contains « FirstLevelSender » then the corresponding method2 and testMethod2 do not exist.
If the name of a test contains « SecondLevelSender » then the corresponding testMethod1 does not exist.

We use the Classification Tree Method to represent the tests. 


Simple tests (no references):
Method: 	TestMethod1 		Method2 			TestMethod2 	Test Identificator
Package: 	P1	P2				P1	P2				P1	P2
			•	|				|	|				|	|			FirstLevelSendersInside
			|	•				|	|				|	|			FirstLevelSendersInside
			|	|				•	|				•	|			SecondLevelSendersInsideTestInside
			|	|				•	|				|	•			SecondLevelSendersInsideTestOutside
			|	|				|	•				•	|			SecondLevelSendersOutsideTestInside
			|	|				|	•				|	•			SecondLevelSendersOutsideTestOutside


Simple tests (no references):
Method: 			TestMethod1 						Method2 																	TestMethod2 										Test Identificator
Package: 			P2									P1				P2								P3							P1		P2 	
Reference: 		Class 	Method Package 			|		Class 	Method Package 		Class 	Method Package 			| 		NoRef 	Class 	Method Package
					•		|		 |					|		|		|		 |				|		|		 |					|		|		|		|		 |					FirstLevelSendersInsideWithRefInClass
					|		•		 |					|		|		|		 |				|		|		 |					|		|		|		|		 |					FirstLevelSendersInsideWithRefInMethod
					|		|		 •					•		|		|		 |				|		|		 |					|		|		•		|		 |					SecondLevelSendersInsideTestOutsideWithRefInClass
					|		|		 |					•		|		|		 |				|		|		 |					|		|		|		•		 |					SecondLevelSendersInsideTestOutsideWithRefInMethod
					|		|		 |					•		|		|		 |				|		|		 |					|		|		|		|		 •					SecondLevelSendersInsideTestOutsideWithRefInPackage
					|		|		 |					|		•		|		 |				|		|		 |					•		|		|		|		 |					SecondLevelSendersOutsidesideTestInsideWithRefInClass
					|		|		 |					|		|		•		 |				|		|		 |					•		|		|		|		 |					SecondLevelSendersOutsidesideTestInsideWithRefInMethod
					|		|		 |					|		|		|		 •				|		|		 |					•		|		|		|		 |					SecondLevelSendersOutsidesideTestInsideWithRefInPackage
					|		|		 |					|		|		|		 |				|		•		 |					|		|		|		•		 |					SecondLevelSendersOutsidesideTestOutsideWithRefInMethod