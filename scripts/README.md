# scripts

scripts is a collection of scripts that I use for my very specific, niche tasks.


## is-rosetta-installed.sh

is-rosetta-installed.sh is a Bash script that checks if Rosetta 2 (translate x86 software to ARM64) is installed on ARM64 Macbooks.

```bash
./is-rosetta-installed.sh
```

```
Yes, Rosetta 2 is installed.
```


## pip_update.py

pip_update.py is a Python script that updates all pip packages at once.

```bash
python3 pip_update.py
```

```
Found 3 packages
$ pip install --upgrade pip setuptools wheel
Requirement already satisfied: pip in /opt/homebrew/lib/python3.11/site-packages (23.3.1)
Requirement already satisfied: setuptools in /opt/homebrew/lib/python3.11/site-packages (69.0.1)
Requirement already satisfied: wheel in /opt/homebrew/lib/python3.11/site-packages (0.41.3)
```
