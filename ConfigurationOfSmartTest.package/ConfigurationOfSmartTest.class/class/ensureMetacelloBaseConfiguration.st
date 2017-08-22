development support
ensureMetacelloBaseConfiguration
	Smalltalk
		at: #ConfigurationOf
		ifAbsent: [ | tmp2 tmp3 |
			tmp2 := MCHttpRepository
				location: 'http://smalltalkhub.com/mc/dkh/metacello/main'
				user: ''
				password: ''.
			tmp2
				versionReaderForFileNamed: 'Metacello-Base-dkh.107'
				do: [ :arg1 | 
					tmp3 := arg1 version.
					tmp3 load.
					tmp3 workingCopy repositoryGroup addRepository: tmp2 ] ]