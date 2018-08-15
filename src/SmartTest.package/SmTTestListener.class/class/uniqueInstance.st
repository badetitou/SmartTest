initialization
uniqueInstance
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]