asserting
shouldEntityBeFiltered: anEntity inPackages: packages
	^ ((IceRepository registry flatCollect: [ :repository | repository loadedPackages collect: #name]) includes: anEntity package name) not.