protocol
queue
	^ queue ifNil: [ queue := SharedQueue new. ]