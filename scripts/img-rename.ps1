# Rename all images in a directory to filenames based on the date taken or modification date

# Folder that contains images, e.g., "C:\Users\scarlet\Pictures\image1.jpg"
$DIRECTORY = "C:\Users\scarlet\Pictures"

# Comment this out if you want to ignore errors (not recommended)
# By default, it will stop on errors outside the try-catch block
$ErrorActionPreference = "Stop"

# Sort so duplicates appear in same order
Get-ChildItem $DIRECTORY | Sort-Object -Property Name | Foreach-Object {
    # Create absolute path for old name
    $old_name_absolute = $_.FullName.ToLower()
    $old_name = $_.Name.ToLower()
    # Write-Host "DEBUG: Checking file: $old_name"
    # Create base name using the last date taken
    try {
        $pic = New-Object System.Drawing.Bitmap($old_name_absolute)
        $bitearr = $pic.GetPropertyItem(36867).Value
        $string = [System.Text.Encoding]::ASCII.GetString($bitearr)
        $date = [datetime]::ParseExact($string, "yyyy:MM:dd HH:mm:ss`0", $Null)
        [string] $base_name = get-date $date -format yyyyMd_HHmmss
        $pic.Dispose()
    }
    # Otherwise, use last date modified
    catch {
        # If cannot access last time, ignore entirely
        if ($_.LastWriteTime -eq $null) {
            write-host "WARNING: couldn't extract filename, ignoring: '$old_name'." -ForegroundColor Yellow -BackgroundColor Red
            return
        }
        else {
            $base_name = "$($_.LastWriteTime.ToString('yyyy-MM-dd HH-mm-ss'))"
        }
    }

    # Combine base and extension (we will use the previous two vars for detecting duplicates)
    $extension = $_.Extension.ToLower() # this includes the dot!
    $new_name = $base_name + $extension
    # Write-Host "DEBUG: Base (created from date, no extension)='$base_name'; extension (extracted from string)='$extension'; combined='$new_name'."

    # Het an array of all filenames (name only) of the files with a similar name already present in the folder
    $all_files = @(Get-ChildItem $DIRECTORY -Filter "$base_name*$extension" -File | Select-Object -ExpandProperty Name)
    # Detect duplicates (same day, hour and minute)
    # Note: this is REALLY slow
    if ($all_files.Count) {
        # Write-Host "DEBUG: Found '$($all_files.Count)' files that have identical name to '$new_name':"
        $count = 1
        while ($all_files -contains $new_name) {
            # If duplicate found, append number
            Write-Host "`tDuplicate found: $new_name (count=$count)" -ForegroundColor Green
            $new_name = "{0} {1}{2}" -f $base_name, $count++, $extension

        }
    }

    # Rename using absolute path
    Write-Host "Renaming '$old_name' to '$new_name'."
    Rename-Item -Path $old_name_absolute $new_name -Force
}
