asserting
shouldEntityBeFiltered: anEntity inPackages: packages
	^ (((IceRepository registry reject: [ :registry | registry name = 'pharo' ]) flatCollect: [ :repository | repository loadedPackages collect: #name]) includes: anEntity package name) not.