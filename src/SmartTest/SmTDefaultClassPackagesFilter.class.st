"
This filter looks in the packages of all methods that reference the class of the changed entity (method or class)

"
Class {
	#name : #SmTDefaultClassPackagesFilter,
	#superclass : #SmTDefaultPackagesFilter,
	#category : #'SmartTest-Filter'
}

{ #category : #accessing }
SmTDefaultClassPackagesFilter >> extractPackagesFrom: anEntity [
	"This method is supposed to find (in addition of the supermethod) for the compiled method:
		- the packages of the senders of the compiled method
		- the packages that contains at least one method of the compiled method class"
	| packages class|
	packages := (super extractPackagesFrom: anEntity) asSet.
	(anEntity isClass) ifTrue: [ class := anEntity  ]ifFalse:[class := anEntity methodClass].
	class allCallsOn do: [ :rgMethod | packages add: (self extractCompiledMethodPackageBaseName: rgMethod compiledMethod) ].
	class extendingPackages do: [ :aPackage | packages add: (self extractCompiledMethodPackageBaseName: aPackage) ].
	^ packages
]
