parsing
parsePackageBaseName: aPackageName
	^(aPackageName substrings: '-') at: 1