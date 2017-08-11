accessing
enable
	SystemAnnouncer uniqueInstance unsubscribe: self.
	{(MethodModified -> #methodModified:)} do: [ :pair | SystemAnnouncer uniqueInstance weak when: pair key send: pair value to: self ].
	morph show
