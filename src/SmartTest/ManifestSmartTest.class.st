"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser

THIS CLASS SHOULD BE RENAMED BECAUSE IT IS NOT AN EVENT
"
Class {
	#name : #ManifestSmartTest,
	#superclass : #PackageManifest,
	#category : #SmartTest
}

{ #category : #'meta-data' }
ManifestSmartTest class >> description [ ^ 'CORA is an extention of QA which display information about test'
]

{ #category : #'meta-data' }
ManifestSmartTest class >> preUnload [
	super
		preUnload.
]
