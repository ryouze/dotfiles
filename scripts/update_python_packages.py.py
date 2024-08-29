import sys
from importlib.metadata import distributions
from subprocess import run

# Determine the pip command based on the operating system
pip_command: str = "pip" if sys.platform == "win32" else "pip3"

# Get all installed packages sorted by name
packages: list[str] = sorted(dist.name for dist in distributions())
print(f"Found {len(packages)} packages.")

# Construct the pip upgrade command
upgrade_command: list[str] = [pip_command, "install", "--upgrade", *packages]

# Display and execute the command
print(f"$ {' '.join(upgrade_command)}")
run(upgrade_command, check=True)  # Raise on non-zero exit code
