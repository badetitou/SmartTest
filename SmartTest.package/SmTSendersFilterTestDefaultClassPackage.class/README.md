I test the strategy SendersFinder with the filterDefaultClassPackage.
The filter should accept any test that is owned by :
	- the package of the modified method;
	- a package that references the class of the modified method.
	
In order to be sure that those test are not considered as callers of the modified method and as references to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method.