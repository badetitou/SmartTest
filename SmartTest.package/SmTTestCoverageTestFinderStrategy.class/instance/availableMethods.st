as yet unclassified
availableMethods
	"Collect the methods that can be used with the wrapper to fill completely the methodToTest dictionnary"
	^ (self availablePackages flatCollect: [ :aPackage | aPackage methods ]) reject: [ :method | method methodClass = SmTTestCoverage ]