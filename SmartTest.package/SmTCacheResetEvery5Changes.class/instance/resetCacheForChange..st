private
resetCacheForChange: aChange
	numberOfChange := numberOfChange + 1. 
	(numberOfChange \\ 5 equals: 0)
		ifTrue: [ cache removeAll ]
	