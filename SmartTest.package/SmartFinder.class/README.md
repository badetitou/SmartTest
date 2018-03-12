I'm the boss !!!

I contain the instance of all the staff the user need.

If you want to specify some strategy
use this way

SmartFinder new
		cache: self cache new;
		filter: self filter new;
		testRunner: self runner;
		smtFinder: self finder new;
		testingStrategy: self strategy new