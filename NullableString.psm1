class NullableString {
    hidden [object] $Value
    NullableString($Value) {
        $this.Value = $Value
    }
    [string] ToString() {
        return [string]($this.Value)
    }
    [string] ToUpper() {
        return (([string]$this.Value).ToUpper())
    }
    [string] ToLower() {
        return (([string]$this.Value).ToLower())
    }
    static [NullableString[]] op_Addition([NullableString] $One, [NullableString] $Two) {
        if ($Null -eq $One) { return [NullableString]::New($Two.Value) }
        if ($Null -eq $Two) { return [NullableString]::New($One.Value) }
        return [NullableString]::New($One.ToString() + $Two.ToString())
    }
}
