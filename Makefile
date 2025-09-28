.PHONY: install check test clean

install:
	ansible-playbook -i localhost, playbook.yml --ask-become-pass

check:
	ansible-playbook -i localhost, playbook.yml --check --ask-become-pass

test:
	docker build -t ros2-test -f test/Dockerfile .
	docker run --rm ros2-test ansible-playbook -i localhost, playbook.yml --syntax-check

clean:
	docker rmi ros2-test 2>/dev/null || true