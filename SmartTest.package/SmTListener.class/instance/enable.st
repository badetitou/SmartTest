protocol
enable
	SystemAnnouncer uniqueInstance unsubscribe: self.
	TestCase announcer unsubscribe: self.
	{(MethodModified -> #methodModified:).
	(MethodAdded -> #methodAdded:)}
		do: [ :pair | SystemAnnouncer uniqueInstance weak when: pair key send: pair value to: self ].