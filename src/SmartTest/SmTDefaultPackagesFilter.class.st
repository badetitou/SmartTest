"
This filter only looks in the package owning the changed entity (method or class)
"
Class {
	#name : #SmTDefaultPackagesFilter,
	#superclass : #SmTFilterStrategy,
	#category : 'SmartTest-Filter'
}

{ #category : #settings }
SmTDefaultPackagesFilter class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #SmTFilter) parent: #SmartFinder; order: 0.6
]

{ #category : #parsing }
SmTDefaultPackagesFilter >> extractClassPackageBaseName: aClass [
	^ self extractPackageBaseName: aClass package name 
]

{ #category : #parsing }
SmTDefaultPackagesFilter >> extractCompiledMethodPackageBaseName: aCompiledMethod [
	^ self extractPackageBaseName: aCompiledMethod package packageName
]

{ #category : #parsing }
SmTDefaultPackagesFilter >> extractMethodDefinitionPackageBaseName: aRGMethodDefinition [
	^ self extractPackageBaseName: aRGMethodDefinition package realPackage packageName 
]

{ #category : #parsing }
SmTDefaultPackagesFilter >> extractPackageBaseName: aPackageName [
	^(aPackageName substrings: '-') at: 1
]

{ #category : #accessing }
SmTDefaultPackagesFilter >> extractPackagesFrom: anEntity [
	"Thid method find:
		- the package of the classes that owned the method
		- the package that contains the method if its an extension"

	| packages |
	packages := Set new.
	anEntity isClass
		ifTrue: [ packages add: (self extractClassPackageBaseName: anEntity)]
		ifFalse: [ packages := {(self extractCompiledMethodPackageBaseName: anEntity)} asSet.
			anEntity isExtension
				ifTrue: [ anEntity package extendedClasses do: [ :aClass | packages add: aClass package name ] ] ].
	^ packages
]

{ #category : #asserting }
SmTDefaultPackagesFilter >> extractPackagesFromTrait: aTrait [
	^ self extractPackageBaseName: aTrait package name
]

{ #category : #asserting }
SmTDefaultPackagesFilter >> shouldEntityBeFilteredOut: anEntity inPackages: packages [
 "(anEntity methodClass allCallsOn collect: #ciPackage) not."
	(anEntity isClass )ifTrue: [^(packages includes: (anEntity package name)) not].
	^ (packages includes: (self extractMethodDefinitionPackageBaseName: anEntity )) not
]
