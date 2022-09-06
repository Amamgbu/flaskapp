# Dockerfile should pass hadolint
lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint --ignore SC2174 --ignore DL3009 --ignore DL3008 --ignore DL3015 --ignore DL3015 --ignore DL3059 --ignore DL3042 --ignore DL3013 --ignore DL3025 Dockerfile