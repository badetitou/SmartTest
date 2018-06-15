accessing
process
	^ process
		ifNil: [ process := [ [ true ]
				whileTrue: [ (Delay forSeconds: 300) wait.
					self collector
						ifNotEmpty: [ | tempOrderedCollection |
							tempOrderedCollection := OrderedCollection new.
							tempOrderedCollection add: self collector .
							([ :aCollectionOfTest | 
							| tempResult |
							tempResult := SmTRules runner runCases: aCollectionOfTest.
							self showResult: tempResult ] newProcessWith: tempOrderedCollection) resume.
							self reset ] ] ] newProcess ]