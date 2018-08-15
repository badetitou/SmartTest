"
This filter only looks in the packages that are loaded with Iceberg
"
Class {
	#name : #SmTIcebergLoadedPackagesFilter,
	#superclass : #SmTFilterStrategy,
	#category : 'SmartTest-Filter'
}

{ #category : #asserting }
SmTIcebergLoadedPackagesFilter >> extractPackagesFrom: aCompiledMethod [
	"Can be implemented to init the filter for a specific research"

	^ ((IceRepository registry reject: [ :registry | registry name = 'pharo' ]) flatCollect: [ :repository | repository loadedPackages])
]

{ #category : #asserting }
SmTIcebergLoadedPackagesFilter >> shouldEntityBeFilteredOut: anEntity inPackages: packages [
	^ ((packages collect: #name) includes: anEntity package name) not
]
