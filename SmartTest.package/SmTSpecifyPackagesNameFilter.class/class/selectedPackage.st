accessing
selectedPackage
	^ ((self packagesRegex substrings: ',')
		flatCollect: [ :packageRegex | 
			RPackageOrganizer default packages
				flatCollect: [ :package | 
					package classTags 
						select: [ :classTag |packageRegex match: classTag categoryName ] thenCollect: #categoryName ] ]) asSet