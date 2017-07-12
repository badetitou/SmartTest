protocol
enable
	| choosenpackages aFinder |
	aFinder := self new.
	choosenpackages := aFinder availablePackages.
	choosenpackages := Array
		with:
			(UIManager default
				chooseFrom: (choosenpackages collect: [ :package | package packageName ])
				values: choosenpackages
				title: 'Select your project packages').
	aFinder fillMethodToTestForPackages: choosenpackages