protocol
enable
	SystemAnnouncer uniqueInstance unsubscribe: self.
	{(MethodModified -> #methodModified:).
	(MethodAdded -> #methodAdded:)}
		do: [ :pair | SystemAnnouncer uniqueInstance weak when: pair key send: pair value to: self ].