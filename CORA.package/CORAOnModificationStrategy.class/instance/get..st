accessing
get: anElement
	"return nil if element absent. The object else"
	self bag remove: anElement methodReference ifAbsent: [ ^nil ].
	^anElement 