accessing
autoUpdateCache: aBoolean
	self smtListener cacheStrategy: self cacheStrategy.
	self smtListener smtDynamicFinder: self smtFinder.
	self smtListener class activated: aBoolean