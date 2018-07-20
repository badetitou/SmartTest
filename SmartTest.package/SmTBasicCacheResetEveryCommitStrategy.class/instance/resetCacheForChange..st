private
resetCacheForChange: aChange
	(aChange isKindOf: EpMonticelloVersionSave) ifTrue:[self resetCache].
	