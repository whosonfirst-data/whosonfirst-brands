UNAME_S := $(shell uname -s)

brand:
ifeq ($(UNAME_S),Darwin)
	utils/darwin/wof-brands-create -name $(NAME) -root ./data
else ifeq ($(UNAME_S),Linux)
	# utils/linux/wof-brands-create -name $(NAME) -root ./data
	echo "please write me..."
	exit 1
else
	echo "this OS is not supported yet"
	exit 1
endif
