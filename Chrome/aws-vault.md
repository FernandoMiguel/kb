to start aws-vault login in a new temporary chrome profile:

` $ open -a "Google Chrome Canary" --args --no-first-run -disk-cache-dir=$(mktemp -d /tmp/chromecanary.XXXXXX) --user-data-dir=$(mktemp -d /tmp/chromecanary.XXXXXX) "$(aws-vault --debug login <PROFILE> --stdout)" `


You can add the following alias to your bash_rc

` alias awslogin='\"open -a \"Google Chrome Canary\" --args --no-first-run -disk-cache-dir=$(mktemp -d /tmp/chromecanary.XXXXXX) --user-data-dir=$(mktemp -d /tmp/chromecanary.XXXXXX) \"$(aws-vault --debug login $p --stdout)\"' `

which allows you to call Roles with:

`$ p=MY-ROLE && awslogin`
