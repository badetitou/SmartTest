parsing
parseCompiledMethodPackageBaseName: aCompiledMethod
	^(aCompiledMethod package packageName substrings: '-') at: 1