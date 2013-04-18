#Set-StrictMode -version latest
<#
package_content.Tests.ps1
Unit / Integration tests used to validate the items in the content folder of your app for the nuget package.

Ex.
Checking to see if a content file exists
Checking to see if a content file contains specific information
Checking to see if a content file is a specific version
Validating the data in the .nuspec file

#>

$modulesPath = (Split-Path -parent $MyInvocation.MyCommand.Path).Replace("\tests", "\modules\")
Import-Module (Join-Path $modulesPath global_config.psm1) -Force

    Describe "package_content" {
<#		
		Context "When package exists" {
			It "checks to see if content\my.config exists" {
				(Test-Path $PackageRoot\content\my.config) | Should Be $true
			}
			
			It "checks to see if content\my.dll exists" {
				(Test-Path $PackageRoot\content\my.dll) | Should Be $true
			}
			
			It "checks to see if content\my.dll is set to version 1.0.0" {
				[System.Diagnostics.FileVersionInfo]::GetVersionInfo("$PackageRoot\content\my.dll").FileVersion | Should be "1.0.0"
			}
		}
		
		Context "When my.config has not been modified" {
			[xml] $configXml = Get-Content $PackageRoot\content\my.config
			$ns = @{ e = "urn:my-config" }
			$ns = New-Object Xml.XmlNamespaceManager $configXml.NameTable
			$ns.AddNamespace( "e", "urn:my-config" )

		
			It "Should contain the static value MEH" {
				$node = $configXml.configuration.service
				$node.ServiceName | Should be "MEH"
			}
		}
		
		Context "When .nuspec file exists and has a metadata element" {
			[xml] $nuspecXml = Get-Content $PackageRoot\*.nuspec
			$node = $nuspecXml.package.metadata
		
			It "Should have id element with value Name" {
				$node.id | Should be "Name"
			}
			
			It "Should have version element with value 1.0.0" {
				$node.version | Should be "1.0.0"
			}
			
			It "Should have title element with value My Title" {
				$node.title | Should be "My Title"
			}
			
			It "Should have owners element with value My Name" {
				$node.owners | Should be "My Name"
			}
			
			It "Should have projectUrl element with value http://archcoder.com" {
				$node.projectUrl | Should be "http://archcoder.com"
			}
			
			It "Should have iconUrl element with value http://archcoder.com/images/avatar.png" {
				$node.iconUrl | Should be "http://archcoder.com/images/avatar.png"
			}
			
			It "Should have requireLicenseAcceptance element that is false" {
				$node.requireLicenseAcceptance | Should be "false"
			}
		}
		
		Context "When .nuspec file exists and has a file element" {
			[xml] $nuspecXml = Get-Content $PackageRoot\*.nuspec
			$ns = @{ e = "urn:my-config" }
			$ns = New-Object Xml.XmlNamespaceManager $nuspecXml.NameTable
			$ns.AddNamespace( "e", "http://schemas.microsoft.com/packaging/2010/07/nuspec.xsd" )
		
			It "Should have file element for my.xml" {
				$result = $nuspecXml.SelectSingleNode("//e:file[@src = 'content\my.xml']", $ns)
				$result.src | Should be $result.target
			}
			
			It "Should have file element for my.xsd" {
				$result = $nuspecXml.SelectSingleNode("//e:file[@src = 'content\my.xsd']", $ns)
				$result.src | Should be $result.target
			}		
			
			It "Should have file element for my.dll" {
				$result = $nuspecXml.SelectSingleNode("//e:file[@src = 'content\my.dll']", $ns)
				$result.src | Should be $result.target
			}	
		
		}
#>
    }