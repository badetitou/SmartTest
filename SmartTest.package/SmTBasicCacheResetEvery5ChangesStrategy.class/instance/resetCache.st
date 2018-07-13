private
resetCache
	numberOfChange := numberOfChange + 1. 
	(numberOfChange \\ 5 == 0)
		ifTrue: [ cache removeAll ]
	