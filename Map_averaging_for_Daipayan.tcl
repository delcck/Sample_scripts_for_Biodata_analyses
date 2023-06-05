######################################################################################
# Task: averaging a set of maps in dx format using VMD
#
# DESCRIPTION:
#
# Below is a sample script coded by Chun Kit Chan.
# When you use this sample sript, change:
# (1) the "list_of_maps" to your detainated list of maps; and
# (2) the "output_name" to your detainated output without the .dx extension.
# P.S. Your should have the temporary/intermediate outputs located
# at the same place as your input list of your maps.
# For minimal modifications, you are encouraged to run this script
# at the same directory with your desired list of input maps.
#######################################################################################

set list_of_maps [list "MAP1" "MAP2" "MAP3" "MAP4"]
set temp_output_name temp_merge
set output_name MAP_OUT

package require voltool

#--Adding up maps
set num_of_maps [llength ${list_of_maps}]
for {set index 1} {$index < $num_of_maps} {incr index} {
  set pre_index [expr $index - 1]
  if {$index == 1} {
    voltool add -i1 [lindex ${list_of_maps} ${pre_index}] -i2 [lindex ${list_of_maps} ${index}] -o ${temp_output_name}_${index}.dx
  } else {
    voltool add -i1 ${temp_output_name}_${pre_index}.dx -i2 [lindex ${list_of_maps} ${index}] -o ${temp_output_name}_${index}.dx
  }
}

#--Averaging the sum
voltool smult -amt ${num_of_maps} -i ${temp_output_name}_${index}.dx -o ${output_name}.dx
