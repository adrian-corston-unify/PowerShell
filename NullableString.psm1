class NullableString {
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
}
