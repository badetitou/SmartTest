private
resetCacheForChange: aChange
	(aChange isKindOf: EpMonticelloVersionSave) ifTrue:[cache removeAll].
	