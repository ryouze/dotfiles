# scripts

A collection of scripts that I use for my very specific, niche tasks.


## img-rename.ps1

A Powershell 5.0 script that renames all images in a directory based on their date.

Or at least that's what I think it does. I wrote it a long time ago and t was broken the last time I tried to use it.

Logic:

1) Use date taken, otherwise use date modified, otherwise do not rename.
2) If duplicate exists, keep incrementing the number appended at the end.

The low performance comes from the fact that each filename is compared against all filenames in order to avoid duplicates.

Still, it's faster than doing it manually.

![A screenshot of Powershell script in a Windows Terminal window](/assets/rename.jpg)


## is-rosetta-installed.sh

A Bash script that checks if Rosetta 2 is installed on ARM64 Macbooks.

Rosetta 2 translates x86 software to ARM64.

```bash
./is-rosetta-installed.sh
```

```
Yes, Rosetta 2 is installed.
```


## pip_update.py

A Python script that updates all pip packages at once.

```bash
python3 pip_update.py
```

```
Found 3 packages.
$ pip install --upgrade pip setuptools wheel
Requirement already satisfied: pip in /opt/homebrew/lib/python3.11/site-packages (23.3.1)
Requirement already satisfied: setuptools in /opt/homebrew/lib/python3.11/site-packages (69.0.1)
Requirement already satisfied: wheel in /opt/homebrew/lib/python3.11/site-packages (0.41.3)
```
