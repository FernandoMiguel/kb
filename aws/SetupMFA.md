# MFA AWS account guide

<!-- TOC -->

- [MFA AWS account guide](#mfa-aws-account-guide)
- [Introduction](#introduction)
    - [AWS Web console](#aws-web-console)
        - [First login](#first-login)
    - [aws-vault](#aws-vault)
        - [aws config](#aws-config)
        - [add aws keys](#add-aws-keys)
    - [Usage](#usage)
        - [more info:](#more-info)

<!-- /TOC -->

# Introduction

Setting up user accounts can be cumberestone. With the multitude of services available on AWS and the easiness of creating new AWS accounts, managing all those user accounts can be overhead.

Ideally, you want to setup all your users in a AWS IAM account, and manage their policies in a single place, allowing for [IAM Roles](https://github.com/FernandoMiguel/AWS-Trust-CrossAccounts) to be assume to grant access to services.

At the same time, you need to securely manage AWS API Access Keys that users have in their devices, and avoid them to be stored in Clear Text, as does aws-cli do by default in `~/.aws/credentials` .

In this short guide, we follow best practices by settings up [Multi Factor Authentication (MFA)](https://github.com/FernandoMiguel/MFAguide) for the users credentials, and using [aws-vault](#aws-vault) to store the Access Keys in a password protected keychain.


## AWS Web console

### First login

Visit https://signin.aws.amazon.com/console

Login and change temporary password.

Access [AWS IAM](https://console.aws.amazon.com/iam/home/users) https://console.aws.amazon.com/iam/home/users and click on your user.

Click `security credentials` and then `Assigned MFA device`. Select `Virtual Device`.

Use [Google Authenticator](https://support.google.com/accounts/answer/1066447) or [Authy](https://authy.com/download/) to generate the Multi Factor Auth tokens.

Log out, login again, entering the new MFA.

Visit the same page and click `Create access keys`

## aws-vault

If user is on Mac, install [brew](https://brew.sh/)

`$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`


Then install [aws-vault](https://github.com/99designs/aws-vault)

`$ brew cask install aws-vault`

And aws-cli

`$ brew install awscli`

For all other OSs, download and install aws-vault from:

https://github.com/99designs/aws-vault/releases

And AWS cli from:

https://aws.amazon.com/cli/


### aws config

Create and edit  `~/.aws/config`

Add the folling profiles, replacing YOUR-USERNAME:

```
[preview]
cloudfront=true

[profile iam]
region=eu-west-1
mfa_serial=arn:aws:iam::ACCOUNTID:mfa/YOUR-USERNAME

[profile another-assumed-role]
region=eu-west-1
role_arn=arn:aws:iam::ACCOUNTID:role/another-assumed-role
source_profile=iam
mfa_serial=arn:aws:iam::ACCOUNTID:mfa/YOUR-USERNAME
```

If other roles are required, add them to the file, using the same structure, and replacing the profile and role name.

###  add aws keys 

Using the AWS Access Keys obtained in [First login:](#first-login), run:

```
$ aws-vault --debug add iam
Enter Access Key Id: ABDCDEFDASDASF
Enter Secret Key: 123456789
```

If you want to rotate your keys, run:

`$ aws-vault --debug rotate`

List aws-vault profiles, roles and sessions:

`$ aws-vault --debug list`

## Usage

To access a sub-shell:

`$ aws-vault --debug exec another-assumed-role  --session-ttl=8h --assume-role-ttl=1h --`

To start aws creds server (sudo access will be requested):

`$ aws-vault --debug exec another-assumed-role  --session-ttl=8h --assume-role-ttl=1h --server`


### more info: 

https://github.com/FernandoMiguel/kb/blob/master/aws-vault/README.md
