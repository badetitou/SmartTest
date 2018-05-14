I test the strategy SendersFinder with the filter RestrictedPackage.
The filter should accept any test that is owned by a package whose name matches the regex.

Here we look for tests in the package SmartDataTestOutsideP1 (this is defined in the SetUp method).

In order to be sure that those test are not considered as callers of the modified method and as references to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method.