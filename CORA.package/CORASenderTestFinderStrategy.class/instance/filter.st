accessing
filter
	^ filter ifNil: [  filter := CORAFilterSettings filter new packages: {package} ]