How to run aws-nuke with aws-vault:

`$ aws-vault --debug exec <PROFILE> --session-ttl=8h --assume-role-ttl=1h --`

`$ aws-nuke  --config config.yml --profile Default`

`--profile Default` is required so it uses the subshell in aws-vault


References:

https://github.com/rebuy-de/aws-nuke

https://github.com/99designs/aws-vault
