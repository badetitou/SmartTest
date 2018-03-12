accessing
autoUpdateCache: aBoolean
	self smtListener cacheClass: self cacheClass.
	self smtListener smtDynamicFinder: self smtFinder.
	self smtListener activated: aBoolean