# Hashtable object type with hidden metadata fields and key/value type enforcement

class SmashTable : hashtable {
    SmashTable(
        [string] $id
    ) {
        $this.PsObject | Add-Member -MemberType NoteProperty -Name id -Value $id
    }

    [string] ID() {
        return $this.PsObject.id
    }

    Add(
        [object] $Key,
        [object] $Value
    ) {
        if ($Key -isnot [string]) { throw "Key must be a [string]" }
        if ($Value -isnot [string]) { throw "Value must be a [string]" }
        ([hashtable]$this).Add($Key, $Value)
    }
}

Function New-SmashTable {
    param([string] $ID)
    if (! $ID) { $ID = New-Guid }
    [SmashTable]::New($ID)
}
