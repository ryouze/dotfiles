"""
Renames all files to random characters in the hardcoded directory.
"""
from string import ascii_lowercase, digits
import os
import random


class Renamer:
    def __init__(self, location: str) -> None:
        """
        Location - path to directory containing files that should be renamed.
        """
        # add forward slash at the end if missing
        self.location: str = location if location[-1] == "/" else location + "/"
        # min/max character length of randomly generated names
        self.name_len_min: int = 5
        self.name_len_max: int = 15
        # max re-attempts when generated a name that already exists before giving up
        self.max_attempts_to_rename: int = 5
        return None

    def random_name(self) -> str:
        """
        Return a string of random lowercase letters and digits.
        """
        random_length = random.randint(self.name_len_min, self.name_len_max)
        return "".join(random.sample(ascii_lowercase + digits, random_length))

    @staticmethod
    def rename_file(old: str, new: str) -> bool:
        """
        Rename a single file from X to Y.
        Return True if succeeded.
        Return False if failed.
        """
        # if rename target already exists, return False
        if os.path.exists(new):
            print(f"rename fail: '{old}' to '{new}', reason: file already exists")
            return False
        try:
            os.rename(old, new)
        except Exception as e:
            print(f"rename fail: '{old}' to '{new}', reason: {e}")
            return False
        else:
            return True

    def run(self) -> None:
        """
        Rename all files within the directory provided.
        """
        # for each file / directory that exists in location
        for num, f_short in enumerate(os.listdir(self.location), start=1):
            f_full = os.path.join(self.location, f_short)
            # ignore non-files and macos ".DS_Store" file that contains folder view (list, icon, tree) info
            if not os.path.isfile(f_full) or f_short == ".DS_Store":
                print(f"{num}. not a file, ignoring: {f_short}")
                continue
            # otherwise, try to rename file up to X attempts
            extension = os.path.splitext(f_short)[1]
            for i in range(self.max_attempts_to_rename):
                f_full_new = self.location + self.random_name() + extension
                # rename; if succeeded, move on to next file
                if self.rename_file(f_full, f_full_new):
                    print(f"{num}. ok: renamed: '{f_full}' -> '{f_full_new}'")
                    break
                print(f"{num}. re-attempt ({i+1}/{self.max_attempts_to_rename})")
                continue
        return None


if __name__ == "__main__":
    location = os.path.expanduser("~") + "/Pictures/pic/"
    print(
        f"[?] rename all the files in the '{location}' directory?"
        "\n[?] enter to confirm, 'q' to quit"
    )
    user_input = input(">").lower()
    if user_input == "q":
        raise SystemExit
    app = Renamer(location=location)
    app.run()
    print("[!] done")
