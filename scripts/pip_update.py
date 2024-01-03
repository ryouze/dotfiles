from importlib.metadata import distributions
from subprocess import call

# Get all packages
packages: list[str] = sorted(item.name for item in distributions())
print(f"Found {len(packages)} packages.")

# Create update command: pip install --upgrade setuptools pip wheel
command: str = f"pip install --upgrade {' '.join(packages)}"

# Update all packages
print(f"$ {command}")
call(command, shell=True)
