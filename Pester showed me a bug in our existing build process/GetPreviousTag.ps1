# Return the latest tag for a branch
function GetPreviousTag {
    # Run the "git describe" command to return the latest tag
    $lastTag = git describe
    # If no tag is present then return false
    if ([string]::IsNullOrEmpty($lastTag)) {
        return $false
    }
    else {
        # If a tag is returned then we need to ensure that its in our expected format:
        # If a commit has taken place but the tag hasn't been bumped then the git describe command will return 
        # refs/tags/1.1.0.a.1-33-gcfsxxxxx, we only want the 1.1.0.a.1 part of the tag so we split off everything after
        # the "-" and trim the "refs/tags/" text.   
        $lastTagTrimmed = $lastTag.Split("-") | Select-Object -First 1
        $lastTagTrimmed = $lastTagTrimmed -replace 'refs/tags/',''
        # Verify that last tag is now in the expected format
        if ([regex]::Match($lastTagTrimmed,'\d+\.\d+\.\d+\.\c\.\d+')) {
            return $lastTagTrimmed
        }
        else {
            return $false
        }
    }
}