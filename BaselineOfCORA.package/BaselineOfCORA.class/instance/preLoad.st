baselines
preLoad
	(CompilationContext bytecodeBackend equals: OpalEncoderForSistaV1)
		ifFalse: [ CompilationContext bytecodeBackend: OpalEncoderForSistaV1.
			Compiler recompileAll ]