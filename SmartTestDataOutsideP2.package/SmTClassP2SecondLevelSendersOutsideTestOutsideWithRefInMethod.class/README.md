Data for SmartTest tests on the filters (defaultClass).

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are controlled and consequently the tests are independent the one from the others.

In the tests, it is always the methods whose name contains 'method1' that are modified. If the name contains first level, the methods are directly called by a test. If the name contains SecondLevel, they are called by an another method (whose name contains 'method2').

If the name of the test contains 'method2', the test use the method method2, if the test contains 'method1', the test directly uses the modified method.

In this class, the first and second level senders are located outside of the package of the modified method and in two different package. 
We test two different setup, one in which both method2 and testMethod2 references directly the class of method1, and another in which method2 references the class of method1 and testMethod2 references the class of method2.