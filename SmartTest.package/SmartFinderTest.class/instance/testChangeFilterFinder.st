initialization
testChangeFilterFinder
	| filterTmp |
	smartFinder smtFinder.
	filterTmp := SmTDefaultPackagesFilter new.
	smartFinder filter: filterTmp.
	self assert: smartFinder smtFinder filter equals: filterTmp