"
This filter only looks in the packages whose names match a given regex
"
Class {
	#name : #SmTSpecifyPackagesNameFilter,
	#superclass : #SmTFilterStrategy,
	#instVars : [
		'packagesRegex',
		'selectedPackages'
	],
	#category : #'SmartTest-Filter'
}

{ #category : #'settings-definition' }
SmTSpecifyPackagesNameFilter class >> packagesRegex: aRegexStringCollection [
	^ self new
		packagesRegex: aRegexStringCollection;
		yourself
]

{ #category : #asserting }
SmTSpecifyPackagesNameFilter >> extractPackagesFrom: aCompiledMethod [ 
	^ self packages.
]

{ #category : #accessing }
SmTSpecifyPackagesNameFilter >> packages [
	"Return the collection of package that was find from the settings"


	^ self selectedPackages
]

{ #category : #accessing }
SmTSpecifyPackagesNameFilter >> packagesRegex [
	^ packagesRegex
]

{ #category : #accessing }
SmTSpecifyPackagesNameFilter >> packagesRegex: anObject [
	packagesRegex := anObject
]

{ #category : #accessing }
SmTSpecifyPackagesNameFilter >> selectedPackages [
	^ (RPackageOrganizer default packages
		flatCollect: [ :package | 
			package classTags
				select: [ :classTag | self packagesRegex asRegex matchesPrefix: classTag categoryName ]
				thenCollect: #categoryName ]) asSet
]

{ #category : #accessing }
SmTSpecifyPackagesNameFilter >> shouldEntityBeFilteredOut: anEntity inPackages: anObject [
 "(anEntity methodClass allCallsOn collect: #ciPackage) not."
	(anEntity isClass) ifTrue:[^ (self packages includes: anEntity category) not].
	^ (self packages includes: anEntity methodClass category) not
]
