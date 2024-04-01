$filePath = ".\choco_install.txt"

# Read the file line by line
Get-Content $filePath | ForEach-Object {
    # Remove whitespace from the beginning and end of the line
    $line = $_.Trim()

    if ($line.StartsWith("#")) {
        continue
    }

    if ($line.StartsWith("!")) {
        $currentCategory = $line.Trim('!')
        Write-Host "Processing category: $currentCategory"
    }
    # Process package names
    elseif ($line -ne "") {
        Write-Host "Installing package: $line"
        # Install the package using Chocolatey
        choco install $line -y
    }
}
