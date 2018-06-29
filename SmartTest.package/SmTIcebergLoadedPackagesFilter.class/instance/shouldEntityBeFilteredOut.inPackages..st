asserting
shouldEntityBeFilteredOut: anEntity inPackages: packages
	^ ((packages collect: #name) includes: anEntity package name) not