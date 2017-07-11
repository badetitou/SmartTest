baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [spec baseline: 'ChangeImpact';
				repository: 'github://juliendelplanque/ChangeImpact/repository';
				group: 'pharo'.
				 spec repository: 'github://badetitou/CORA';
			 package: 'CORA';
			 group: 'default' with: #('CORA').
			 ]