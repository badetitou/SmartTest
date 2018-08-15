protocol
collectPackageWithBaseName: aBaseNamePackage
	^ RPackageOrganizer default packages select: [ :p | aBaseNamePackage,'*' match: p packageName ]