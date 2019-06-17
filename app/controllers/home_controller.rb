class HomeController < ApplicationController
  def index
  	require 'net/http'
  	require 'json'
  	#@url ='http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20002&distance=0&API_KEY=42663F16-C7B4-4016-995E-7E397DC531B1'
  	@url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20002&distance=0&API_KEY=42663F16-C7B4-4016-995E-7E397DC531B1'
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@output = JSON.parse(@response)
  #check for empty string
  	if @output.empty?
  		@final_output = "Error"
  	elsif !@output
  		@final_output = "Error"  				
  	else
  		@final_output=@output[0]['AQI']
  	end	

  	if @final_output=="Error"
  		@api_color = "gray"
  		@api_description = "No zip code found!"
  	elsif @final_output<=50
  		@api_color = "green"
  		@api_description = "AQI: Good (0 - 50)"
  	elsif @final_output>=51 && @final_output<=100
  		@api_color = "yellow"
  		@api_description = "AQI: Moderate (51 - 100)"
  	elsif @final_output>=101 && @final_output<=150
  		@api_color = "orange"
  		@api_description = "AQI: Unhealthy for Sensitive Groups (101 - 150)"
  	elsif @final_output>=151 && @final_output<=200
  		@api_color = "red"
  		@api_description = "AQI: Unhealthy (151 - 200) "
  	elsif @final_output>=201 && @final_output<=300
  		@api_color = "purple"
  		@api_description = "AQI: Very Unhealthy (201 - 300)"
  	elsif @final_output>=301 && @final_output<=500
  		@api_color = "maroon"
  		@api_description = "AQI: Hazardous (301 - 500)"							
  		
  	end
  end
  def zipcode
  	@zipquery = params[:zipcode]
  	if params[:zipcode] == ""
  		@zipquery="Zipcode cannot be empty!"
  	elsif params[:zipcode]
  			
		require 'net/http'
  	require 'json'
  	#@url ='http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20002&distance=0&API_KEY=42663F16-C7B4-4016-995E-7E397DC531B1'
  	@url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=' + @zipquery.to_s+ '&distance=0&API_KEY=42663F16-C7B4-4016-995E-7E397DC531B1'
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@output = JSON.parse(@response)
  #check for empty string
  	if @output.empty?
  		@final_output = "Error"
  	elsif !@output
  		@final_output = "Error"  				
  	else
  		@final_output=@output[0]['AQI']
  	end	

  	if @final_output=="Error"
  		@api_color = "gray"
  		@api_description = "No zip code found!"
  	elsif @final_output<=50
  		@api_color = "green"
  		@api_description = "AQI: Good (0 - 50)"
  	elsif @final_output>=51 && @final_output<=100
  		@api_color = "yellow"
  		@api_description = "AQI: Moderate (51 - 100)"
  	elsif @final_output>=101 && @final_output<=150
  		@api_color = "orange"
  		@api_description = "AQI: Unhealthy for Sensitive Groups (101 - 150)"
  	elsif @final_output>=151 && @final_output<=200
  		@api_color = "red"
  		@api_description = "AQI: Unhealthy (151 - 200) "
  	elsif @final_output>=201 && @final_output<=300
  		@api_color = "purple"
  		@api_description = "AQI: Very Unhealthy (201 - 300)"
  	elsif @final_output>=301 && @final_output<=500
  		@api_color = "maroon"
  		@api_description = "AQI: Hazardous (301 - 500)"							
  		
  	end  			





















  		
  	end
  end	

end
