private
at: key ifPresent: aPresentBlock ifAbsent: anAbsentBlock
	^ self currentCache at: key ifPresent: aPresentBlock ifAbsent: anAbsentBlock