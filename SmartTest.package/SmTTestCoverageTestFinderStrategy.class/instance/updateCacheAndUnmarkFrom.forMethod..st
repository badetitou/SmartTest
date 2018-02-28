jenkins
updateCacheAndUnmarkFrom: wrappers forMethod: aTestMethod
	| aToResetAfterMarkCollection |
	aToResetAfterMarkCollection := wrappers select: [ :each | each hasRun ].
	"self haltIf: [ aToResetAfterMarkCollection notEmpty ]."
	self addATest: aTestMethod toACollectionOfMethod: aToResetAfterMarkCollection.
	aToResetAfterMarkCollection do: [ :each | each unmark ]