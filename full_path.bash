#-----------------------------------------------------------------------------#
# full_path:
# Whenever this function is called (even during source) it returns the full path of the current caller
full_path()
{
  # This figures out where the file is stored and saves it into $SCRIPT_PATH
  # This allowes to run the source script from anywhere
  local script_path="${BASH_SOURCE[0]}";
  if ([ -h "${script_path}" ]) then
    while([ -h "${script_path}" ]) do script_path=`readlink "${script_path}"`; done
  fi
  pushd . > /dev/null
  cd `dirname ${script_path}` > /dev/null
  local script_path=`pwd`;
  popd  > /dev/null

  echo $script_path
}
