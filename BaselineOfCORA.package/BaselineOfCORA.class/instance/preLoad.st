baselines
preLoad
	(CompilationContext bytecodeBackend = OpalEncoderForSistaV1)
		ifFalse: [ CompilationContext bytecodeBackend: OpalEncoderForSistaV1.
			Compiler recompileAll ]