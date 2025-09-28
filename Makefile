.PHONY: install jazzy humble check test clean

# Default to jazzy (latest)
install: jazzy

jazzy:
	@echo "Installing ROS2 Jazzy for Ubuntu 24.04..."
	ansible-playbook -i localhost, playbook.yml --ask-become-pass

humble:
	@echo "Installing ROS2 Humble for Ubuntu 22.04..."
	ansible-playbook -i localhost, playbook.yml --ask-become-pass -e ros_distro=humble

check:
	ansible-playbook -i localhost, playbook.yml --check --ask-become-pass

check-humble:
	ansible-playbook -i localhost, playbook.yml --check --ask-become-pass -e ros_distro=humble

test:
	docker build -t ros2-test -f test/Dockerfile .
	docker run --rm ros2-test ansible-playbook -i localhost, playbook.yml --syntax-check

clean:
	docker rmi ros2-test 2>/dev/null || true