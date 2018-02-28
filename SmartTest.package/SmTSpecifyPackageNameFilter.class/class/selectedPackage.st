accessing
selectedPackage
	^ ((self packagesRegEx substrings: ',')
		flatCollect: [ :packageRegex | 
			RPackageOrganizer default packages
				collect: #name
				thenSelect: [ :packageName | packageRegex match: packageName ] ]) asSet