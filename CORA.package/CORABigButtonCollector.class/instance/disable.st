accessing
disable
	"Do not receiver any system change notification anymore"
	morph window isClosed ifFalse: [ morph window close] .
	SystemAnnouncer uniqueInstance unsubscribe: self