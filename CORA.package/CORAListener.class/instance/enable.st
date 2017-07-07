protocol
enable
	SystemAnnouncer uniqueInstance unsubscribe: self.
	{(ClassAdded -> #behaviorAdded:).
	(ClassRemoved -> #behaviorRemoved:).
	(ClassRecategorized -> #classRecategorized:).
	(ClassRenamed -> #classRenamed:).
	(ClassCommented -> #classCommented:).
	(ClassModifiedClassDefinition -> #behaviorModified:).
	(MethodAdded -> #methodAdded:).
	(MethodModified -> #methodModified:).
	(MethodRemoved -> #methodRemoved:).
	(MCWorkingCopyCreated -> #mcWorkingCopyCreated:).
	(MCWorkingCopyDeleted -> #mcWorkingCopyDeleted:)}
		do: [ :pair | SystemAnnouncer uniqueInstance weak when: pair key send: pair value to: self ]