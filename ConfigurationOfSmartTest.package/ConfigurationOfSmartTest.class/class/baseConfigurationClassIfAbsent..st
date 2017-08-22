development support
baseConfigurationClassIfAbsent: arg1
	^ Smalltalk
		at: #ConfigurationOf
		ifAbsent: [ self ensureMetacelloBaseConfiguration.
			Smalltalk at: #ConfigurationOf ifAbsent: arg1 ]