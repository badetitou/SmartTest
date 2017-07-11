accessing
availableTestPackages
	| availablePackages |
	(availablePackages := RPackageOrganizer default packages
		reject: [ :package | 
			(package packageName beginsWith: 'Kernel')
				or: [ (package packageName beginsWith: 'Collections')
						or: [ (package packageName beginsWith: 'GT')
or: [ (package packageName beginsWith: 'Ring')
								or: [ (package packageName beginsWith: 'Regex')
										or: [ (package packageName beginsWith: 'Exceptions')
												or: [ (package packageName beginsWith: 'SUnit')
														or: [ (package packageName beginsWith: 'System') ] ] ] ] ] ] ] ])
		sort: [ :a :b | a packageName < b packageName ].
	^ availablePackages