docker:
	buildctl build \
		--frontend dockerfile.v0 \
		--local dockerfile=. \
		--local context=. \
		--output type=image,name=registry.moonrhythm.io/pgbackupr2,push=true
