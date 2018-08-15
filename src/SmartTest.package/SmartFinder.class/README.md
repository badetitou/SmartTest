I'm the boss !!!

I contain the instance of all the stuff the user needs.

If you want to specify some strategy
use it more or less that way (here with the default values)

SmartFinder new
		cache: self cacheStrategy new;
		filter: self filter new;
		testRunner: self testRunner;
		smtFinder: self smtFinder new;
		testingStrategy: self testingStrategy new