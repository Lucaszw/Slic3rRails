require 'shellwords'

class HomeController < ApplicationController
  def index
  end

  def submit
    `clear`
    default_yes = 'extra_perimeters', 'randomize_start', 'retract_layer_change'
    stlLocation = "Internal/models/polysoup.stl"


    gcode_string = ""
    params[:generator].each do |generator|
      # If the default is yes , flip values ( ie sending flag has opp effect... => Sic3r is dumb sometimes...)
      if default_yes.include? generator[0]
        generator[1] == "no" ? generator[1] = "yes" : generator[1] == "no"
      end

      # Check if the user actually submitted something, else don't add a flag
      if generator[1] != nil && generator[1] != "" && generator[1].present?
        # if from a checkbox , and the box is checked : 
        if generator[1] == "yes"
          gcode_string << "--" + generator[0].gsub("_","-") + " "
        elsif generator[1] != "no"
          # Else submit as a flag + a condition :
          gcode_string << "--" + generator[0].gsub("_","-") + " " + generator[1]+" "
        end
        # Print to console :
      end
    end
    puts gcode_string
    string = open("|sudo Internal/Slic3r/slic3r.pl " + gcode_string  + stlLocation).read()
    render :text => "|sudo Internal/Slic3r/slic3r.pl " + gcode_string  + stlLocation
  end
end
