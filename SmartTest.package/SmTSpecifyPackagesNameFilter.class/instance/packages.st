accessing
packages
	"Return the collection of package that was found from the settings"
	^selectedPackages ifNil: [
		selectedPackages := (RPackageOrganizer default packages
			flatCollect: [ :package | 
				package classTags
					select: [ :classTag | self packagesRegex asRegex matchesPrefix: classTag categoryName ]
					thenCollect: #categoryName ]) asSet
			].
		