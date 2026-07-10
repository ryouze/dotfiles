# /// script
# dependencies = ["json5"]
# ///

"""
Sort Zed confg file.

Usage: uv run configs/Zed/sort.py
"""

import json
from pathlib import Path

import json5

path = Path(__file__).with_name("settings.json")

data = json5.loads(path.read_text())
out: str = json.dumps(data, indent=2, sort_keys=True) + "\n"

path.write_text(out)
