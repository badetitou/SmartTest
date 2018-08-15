accessing
activated
	^ activated
		ifNil: [ activated := false.
			self uniqueInstance activated: false ]