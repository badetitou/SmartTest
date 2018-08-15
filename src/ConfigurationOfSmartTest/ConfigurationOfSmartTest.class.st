Class {
	#name : #ConfigurationOfSmartTest,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfSmartTest'
}

{ #category : #'development support' }
ConfigurationOfSmartTest class >> DevelopmentSupport [
	<apiDocumentation>
	
]

{ #category : #'development support' }
ConfigurationOfSmartTest class >> baseConfigurationClassIfAbsent: arg1 [
	^ Smalltalk
		at: #ConfigurationOf
		ifAbsent: [ self ensureMetacelloBaseConfiguration.
			Smalltalk at: #ConfigurationOf ifAbsent: arg1 ]
]

{ #category : #'development support' }
ConfigurationOfSmartTest class >> ensureMetacello [
	(self baseConfigurationClassIfAbsent: [  ]) ensureMetacello
]

{ #category : #'development support' }
ConfigurationOfSmartTest class >> ensureMetacelloBaseConfiguration [
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
]

{ #category : #'development support' }
ConfigurationOfSmartTest class >> isMetacelloConfig [
	^ true
]

{ #category : #'development support' }
ConfigurationOfSmartTest class >> load [
	<apiDocumentation>
	^ (self project version: #stable) load
]

{ #category : #'development support' }
ConfigurationOfSmartTest class >> loadBleedingEdge [
	<apiDocumentation>
	^ (self project version: #bleedingEdge) load
]

{ #category : #'development support' }
ConfigurationOfSmartTest class >> loadDevelopment [
	<apiDocumentation>
	^ (self project version: #development) load
]

{ #category : #'development support' }
ConfigurationOfSmartTest class >> project [
	^ self new project
]

{ #category : #'development support' }
ConfigurationOfSmartTest class >> validate [
	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox)
		validateConfiguration: self
		debug: #()
		recurse: false) explore
]

{ #category : #'symbolic versions' }
ConfigurationOfSmartTest >> customProjectAttributes [
	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfSmartTest >> dev01: spec [
	<version: 'dev-01'>
	
	spec for: #'common' do: [
  		spec
			baseline: 'SmartTest'
			with: [ 
				spec 
					repository: 'github://badetitou/SmartTest' ] ].
]

{ #category : #'symbolic versions' }
ConfigurationOfSmartTest >> development: spec [
	<symbolicVersion: 'development'>
	
	spec for: #'common' version: 'dev-01'.
]

{ #category : #'symbolic versions' }
ConfigurationOfSmartTest >> master: spec [
	<version: 'master'>
	
	spec for: #'common' do: [
  		spec
			baseline: 'SmartTest'
			with: [ spec repository: 'github://badetitou/SmartTest:master' ] ]
]

{ #category : #'symbolic versions' }
ConfigurationOfSmartTest >> project [
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
]

{ #category : #'symbolic versions' }
ConfigurationOfSmartTest >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: 'master'.
]
