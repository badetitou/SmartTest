accessing
selectedPackages
	^ (RPackageOrganizer default packages
		flatCollect: [ :package | 
			package classTags
				select: [ :classTag | self packagesRegex asRegex matchesPrefix: classTag categoryName ]
				thenCollect: #categoryName ]) asSet