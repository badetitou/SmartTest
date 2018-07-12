private
resetCacheForChange: aChange
	(aChange class equals: EpMonticelloVersionSave) ifTrue:[cache removeAll].
	