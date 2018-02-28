accessing
smtFinder
	^ smtFinder ifNil: [ smtFinder := SmTFinder new filter: self filter; cache: self cache ]