The Wrapper strategy is a dynamic test regression finder.

It only does the reseach for method one by one.

  ts := TestSuite new.
ts addTest: (SmTClassTest selector: #testMethod1).
ts addTest: (SmTClassTest selector: #testMethod2).
ts addTest: (SmTClassTest selector: #testMethod3).
ts addTest: (SmTClassTest selector: #testMethod4).
sf := SmartFinder new.
sf smtFinder: SmTTestCoverageTestFinderStrategy new.
sf buildCacheFromTestSuite: ts.
sf cacheValues 