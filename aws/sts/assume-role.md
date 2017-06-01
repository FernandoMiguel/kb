From an instance with a role assigned, run ```aws configure``` with blank credentials and extract them from STS
```
aws sts assume-role --role-arn arn:aws:iam::ACCOUNTID:role/ROLENAME --role-session-name "RoleSession1" --profile default > assume-role-output.txt
```
