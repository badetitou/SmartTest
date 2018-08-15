testing
isCORAMethodBlacklisted: aCompiledMethod
	^ (aCompiledMethod pragmaAt: #CORATestBlacklisted) isNotNil