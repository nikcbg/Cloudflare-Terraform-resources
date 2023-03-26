# Cloudflare-Terraform-resources

## The scripts folder conatins a bash script taht does the following:

- sets Cloudflare API token as an environment variable.
- sets the output directory for your Terraform files to a subdirectory called "terraform" in the current directory.
- checks if the output directory exists, and creates it if it doesn't.
- uses `cf-terraforming` to get a list of all the zones in the account.
- loops through each zone and generates a Terraform file for it.
- gets the TLD of the zone by using `awk` to extract the last part of the domain name.
- creates a directory for the TLD if it doesn't exist.
- generates a Terraform file for the zone using `cf-terraforming` and sorts the output alphabetically by name.
- writes the output to a file with a name based on the zone and TLD.

## The terraform folder conatains 
- `*.tf` files with terraform resources for corresponding Cloudflare zone. 
