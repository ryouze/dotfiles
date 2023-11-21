import importlib.metadata
from os import name as os_name
from subprocess import call

# `pip` on Windows, `pip3` on MacOS and GNU/Linux
pip_name: str
if os_name == "nt":
    pip_name = "pip"
    print("INFO: using `pip` instead of `pip3`, because you are running Windows.")
else:
    pip_name = "pip3"

# Get all packages
packages: list[str] = sorted(item.name for item in importlib.metadata.distributions())
print(f"Found {len(packages)} packages.")

# Create update command: pip3 install --upgrade setuptools pip wheel
command: str = f"{pip_name} install --upgrade {' '.join(packages)}"

# Update all packages
print(f"$ {command}")
call(command, shell=True)
