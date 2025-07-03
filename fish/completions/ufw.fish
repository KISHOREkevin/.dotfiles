complete -c ufw -f -n __fish_use_subcommand -a enable -d "Enable firewall"
complete -c ufw -f -n __fish_use_subcommand -a disable -d "Disable firewall"
complete -c ufw -f -n __fish_use_subcommand -a status -d "Show status (verbose: add 'verbose')"
complete -c ufw -f -n __fish_use_subcommand -a reload -d "Reload firewall rules"
complete -c ufw -f -n __fish_use_subcommand -a reset -d "Reset firewall to defaults"

# Rules management
complete -c ufw -f -n "__fish_seen_subcommand_from allow deny reject limit" -a "(__fish_complete_list , 'Port/service (e.g., 22/tcp or ssh)')"
complete -c ufw -f -n __fish_use_subcommand -a allow -d "Allow traffic on port"
complete -c ufw -f -n __fish_use_subcommand -a deny -d "Block traffic on port"
complete -c ufw -f -n __fish_use_subcommand -a reject -d "Reject with error"
complete -c ufw -f -n __fish_use_subcommand -a limit -d "Rate-limit connections"

# App profiles
complete -c ufw -f -n __fish_use_subcommand -a app -d "Application profile management"
complete -c ufw -f -n "__fish_seen_subcommand_from app" -a list -d "List app profiles"
complete -c ufw -f -n "__fish_seen_subcommand_from app" -a info -d "Show app profile details"
complete -c ufw -f -n "__fish_seen_subcommand_from app" -a update -d "Update app profiles"

# Logging
complete -c ufw -f -n __fish_use_subcommand -a logging -d "Toggle logging"
complete -c ufw -f -n "__fish_seen_subcommand_from logging" -a on -d "Enable logging"
complete -c ufw -f -n "__fish_seen_subcommand_from logging" -a off -d "Disable logging"
complete -c ufw -f -n "__fish_seen_subcommand_from logging" -a low -d "Low verbosity"
complete -c ufw -f -n "__fish_seen_subcommand_from logging" -a medium -d "Medium verbosity"
complete -c ufw -f -n "__fish_seen_subcommand_from logging" -a high -d "High verbosity"
