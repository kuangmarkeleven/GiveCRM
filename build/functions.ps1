#------------------------------------------------------------------------------------------------------------------#
#----------------------------------------Global Functions----------------------------------------------------------#
#------------------------------------------------------------------------------------------------------------------#

function global:run_msbuild ($solutionPath, $configuration)
{
    exec { & msbuild $solutionPath "/t:rebuild" "/p:Configuration=$configuration;DeployOnBuild=true;DeployTarget=Package;AutoParameterizationWebConfigConnectionStrings=False" }
}

function global:move_package ($source_dir, $destination_dir)
{
    Copy-Item "$source_dir\*" $destination_dir -recurse
}

function global:clean_up_pdb_files($package_dir)
{
    Remove-Item "$package_dir\bin\*" -include "*.pdb"
}

function global:clean_directory ($package_dir)
{
    Remove-Item "$package_dir\*" -recurse
}