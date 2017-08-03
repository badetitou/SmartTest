accessing
isCORAMethodBlacklisted: aCompiledMethod
	^ (aCompiledMethod pragmaAt: #CORATestBlacklisted) isNotNil