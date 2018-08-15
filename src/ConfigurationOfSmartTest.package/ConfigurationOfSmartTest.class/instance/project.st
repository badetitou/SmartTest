symbolic versions
project
	| tmp1 |
	tmp1 := project.
	^ tmp1
		ifNil: [ self class ensureMetacello.
			project := MetacelloMCProject new
				projectAttributes: self customProjectAttributes.
			(Smalltalk at: #MetacelloVersionConstructor)
				on: self
				project: project.
			project loadType: #linear.
			project ]
		ifNotNil: [ tmp1 ]