as yet unclassified
openWithSmartFinder: aSmartFinder
	self new
		smartFinder: aSmartFinder;
		items: RPackageOrganizer default packages;
		openWithSpec