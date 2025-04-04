#!/usr/bin/env ruby

require 'thor'
require 'net/http'
require 'json'
require 'uri'

class CLI < Thor
    desc "hello NAME", "say hello to NAME"
    def hello(name)
        puts "Hello, #{name}!"
    end

    desc "install CONTRACT_ID", "install a contract by querying the API with CONTRACT_ID"
    def install(contract_id)
        puts "Fetching contract information for ID: #{contract_id}"
        
        # Define the API endpoint
        api_url = URI("http://localhost:3000/api/v1/contracts/#{contract_id}")
        
        begin
            # Make the API request
            response = Net::HTTP.get_response(api_url)
            
            # Check if the response was successful
            if response.is_a?(Net::HTTPSuccess)
                # Parse the JSON response
                contract_data = JSON.parse(response.body)
                
                # Display the response
                puts "Contract information:"
                puts JSON.pretty_generate(contract_data)
                
                # You can add additional processing here if needed
                # For example, installing something based on the contract data
                
                puts "Installation complete!"
            else
                puts "Error: API returned status code #{response.code}"
                puts response.body
            end
        rescue => e
            puts "Error: Failed to connect to the API - #{e.message}"
        end
    end

    desc "project [PROJECT_ID]", "fetch contracts for a project or all projects"
    def project(project_id = nil)
        if project_id
            puts "Fetching contracts for project ID: #{project_id}"
            # Define the API endpoint for a specific project
            api_url = URI("http://localhost:3000/api/v1/contracts/project/#{project_id}")
            
            begin
                # Make the API request
                response = Net::HTTP.get_response(api_url)
                
                # Check if the response was successful
                if response.is_a?(Net::HTTPSuccess)
                    # Parse the JSON response
                    contracts_data = JSON.parse(response.body)
                    
                    # Display only name, app_id and version for each contract
                    puts "Contracts for project #{project_id}:"
                    puts "---------------------------------"
                    
                    if contracts_data.empty?
                        puts "No contracts found for this project."
                    else
                        contracts_data.each do |contract|
                            name = contract["name"] || "Unnamed contract"
                            app_id = contract["app_id"] || "N/A"
                            version = contract["version"] || "N/A"
                            
                            puts "#{name} - App ID: #{app_id}, Version: #{version}"
                        end
                        
                        puts "---------------------------------"
                        puts "Total contracts: #{contracts_data.length}"
                    end
                    
                    puts "Fetch complete!"
                else
                    puts "Error: API returned status code #{response.code}"
                    puts response.body
                end
            rescue => e
                puts "Error: Failed to connect to the API - #{e.message}"
            end
        else
            puts "Fetching projects summary..."
            # Define the API endpoint for all projects
            api_url = URI("http://localhost:3000/api/v1/projects")
            
            begin
                # Make the API request
                response = Net::HTTP.get_response(api_url)
                
                # Check if the response was successful
                if response.is_a?(Net::HTTPSuccess)
                    # Parse the JSON response
                    projects_data = JSON.parse(response.body)
                    
                    # Display only name, abbreviation and number of contracts for each project
                    puts "Projects summary:"
                    puts "-----------------"
                    
                    projects_data.each do |project|
                        # Assuming the API returns an array of project objects with these fields
                        # Adjust field names if they're different in your actual API response
                        name = project["name"] || "Unnamed project"
                        abbr = project["abbreviation"] || "N/A"
                        contracts_count = project["contract_count"] 
                        
                        puts "#{name} (#{abbr}) - #{contracts_count} contracts"
                    end
                    
                    puts "-----------------"
                    puts "Total projects: #{projects_data.length}"
                else
                    puts "Error: API returned status code #{response.code}"
                    puts response.body
                end
            rescue => e
                puts "Error: Failed to connect to the API - #{e.message}"
            end
        end
    end
end

CLI.start(ARGV)