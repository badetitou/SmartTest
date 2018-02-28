accessing
smtFinder: aSmTTestFinderStrategy
	smtFinder := aSmTTestFinderStrategy.
	smtFinder filter: self filter;
				cache: self cache 