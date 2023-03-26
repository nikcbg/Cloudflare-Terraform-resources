#!/bin/bash

# Set Cloudflare API token
export CF_API_TOKEN=<your_api_token>

# Set the output directory for Terraform files
output_dir="./terraform"

# Create the output directory if it doesn't exist
if [ ! -d "$output_dir" ]; then
  mkdir -p "$output_dir"
fi

# Get a list of all zones
zones=$(cf-terraforming list-zones)

# Loop through each zone and generate a Terraform file
for zone in $zones; do
  # Get the TLD of the zone
  tld=$(echo $zone | awk -F. '{print $NF}')
  
  # Create a directory for the TLD if it doesn't exist
  tld_dir="$output_dir/$tld"
  if [ ! -d "$tld_dir" ]; then
    mkdir -p "$tld_dir"
  fi
  
  # Generate the Terraform file for the zone
  zone_file="$tld_dir/$zone.tf"
  echo "Generating Terraform file for zone $zone"
  cf-terraforming list-records --zone $zone | sort -k2 > $zone_file
done
