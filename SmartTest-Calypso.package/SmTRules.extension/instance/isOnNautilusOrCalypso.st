*SmartTest-Calypso
isOnNautilusOrCalypso
	"20 items means at least Nautilus"
	| he |
	he := thisContext stack collect: [ :c | c methodClass asString ] .
	^ he anySatisfy: [:el | 'ClyNavigationEnvironment' match: el]