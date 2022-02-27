class NullableString : IComparable {
    hidden [object] $Value
    NullableString($Value) {
        $this.Value = $Value
    }
    [string] ToString() {
        return [string]$this.Value
    }
    [NullableString] ToUpper() {
        if ($Null -eq $this.Value) { return [NullableString]::New($Null) }
        return [NullableString]([string]$this.Value).ToUpper()
    }
    [NullableString] ToLower() {
        if ($Null -eq $this.Value) { return [NullableString]::New($Null) }
        return [NullableString]([string]$this.Value).ToLower()
    }
    static [NullableString] op_Addition([NullableString] $One, [NullableString] $Two) {
        if ($Null -eq $One) { return [NullableString]::New($Two.Value) }
        if ($Null -eq $Two) { return [NullableString]::New($One.Value) }
        return [NullableString]::New([string]$One.Value + [string]$Two.Value)
    }

    static [boolean] op_eq([NullableString] $One, [NullableString] $Two) {
        if ($Null -eq $One -and $Null -eq $Two) { return $True }
        if ($Null -eq $One -or $Null -eq $Two) { return $False }
        return ([string]$One.Value) -eq ([string]$Two.Value)
    }

    [int] CompareTo([object] $Other) {
        if ($Null -eq $this.Value -and $Null -eq $Other.Value) { return 0 }
        if ($Null -eq $this.Value) { return -1 }
        if ($Null -eq $Other.Value) { return 1 }
        return ([string]$this.Value).CompareTo([string]$Other.Value)
    }

    [boolean] Equals([object] $Other) {
        if ($Null -eq $this.Value -and $Null -eq $Other.Value) { return $True }
        if ($Null -eq $this.Value -or $Null -eq $Other.Value) { return $False }
        return ([string]$this.Value) -eq ([string]$Other.Value)
    }

    [int] GetHashCode() {
        if ($Null -eq $this.Value) { return 0 }
        return $this.Value.ToLowerInvariant().GetHashCode()
    }
}
