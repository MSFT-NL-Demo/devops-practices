[CmdletBinding()]
param (
    [Parameter()]
    $Url
)

Describe "API Tests" {

    BeforeDiscovery {
        $script:BaseUri = $Url
        $script:Headers = @{
            'Content-Type'    = 'application/json'
        }
    }

    Context "Function is warmed up" {
        BeforeAll{
            $response = (Invoke-WebRequest -Method Get -Uri $BaseUri -Headers $Headers -UseBasicParsing).Content
        }
        It "Should return a 200" {
            $response = Invoke-WebRequest -Uri $Url
            $response.StatusCode | Should -Be 200
        }
    }

    Context "Correct response" {
        It "Should return a valid response" {
            $webcall = Invoke-WebRequest -Method Get -Uri $BaseUri -Headers $Headers -UseBasicParsing
            $webcall.content | Should -NotBeNullOrEmpty
        }
    }
}