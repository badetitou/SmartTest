accessing
title
	 (self hasModifications)
				ifTrue: [ ^ 'You should run tests relative to your last modification' ].
	^ 'You should run these tests'