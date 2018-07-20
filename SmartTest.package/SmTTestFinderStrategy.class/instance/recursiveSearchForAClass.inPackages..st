private - search
recursiveSearchForAClass: aClass inPackages: packagesToLookAt
	^ self recursiveSearchForAClass: aClass inPackages: packagesToLookAt alreadyVisited: Set new