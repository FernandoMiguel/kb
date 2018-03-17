Based on [acme.sh](https://acme.sh) client for [Let's Encrypt](https://letsencrypt.org/)

## install
```
curl https://get.acme.sh | sh

acme.sh --update-account --accountemail "foobar@example.com"
```


## issue

### with Cloudflare API
Based on https://github.com/Neilpang/acme.sh/tree/master/dnsapi#1-use-cloudflare-domain-api-to-automatically-issue-cert


get Cloudflare API key from https://www.cloudflare.com/a/account/my-account

```
export CF_Key="sdfsdfsdfljlbjkljlkjsdfoiwje"
export CF_Email="xxxx@example.com"

acme.sh --issue --dns dns_cf -d example.com --dnssleep 10 \
--keylength ec-256 \
--config-home /PATH/SOMEWHERE/ \
--key-file /etc/ssl/private/DOMAIN.TLD.key \
--fullchain-file /etc/ssl/private/DOMAIN.TLD.fullchain.pem \
--reloadcmd "service nginx reload" \
--staging
```


### with AWS Route 53 API
Follow https://github.com/Neilpang/acme.sh/wiki/How-to-use-Amazon-Route53-API to get API keys

```
export  AWS_ACCESS_KEY_ID=XXXXXXXXXX
export  AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXX

acme.sh --issue --dns dns_aws -d example.com --dnssleep 60 \
--keylength ec-256 \
--config-home /PATH/SOMEWHERE/ \
--key-file /etc/ssl/private/DOMAIN.TLD.key \
--fullchain-file /etc/ssl/private/DOMAIN.TLD.fullchain.pem \
--reloadcmd "service nginx reload" \
--staging
```

### with AWS Route 53 API with aws-vault

```
aws-vault --debug exec <PROFILE> --server
```
```
acme.sh --issue --dns dns_aws -d example.com --dnssleep 60 \
--keylength ec-256 \
--config-home /PATH/SOMEWHERE/ \
--key-file /etc/ssl/private/DOMAIN.TLD.key \
--fullchain-file /etc/ssl/private/DOMAIN.TLD.fullchain.pem \
--reloadcmd "service nginx reload" \
--staging
```


### with nginx mode
Based on https://github.com/Neilpang/acme.sh#7-use-nginx-mode

```
acme.sh --issue --nginx -d example.com \
--keylength ec-256 \
--config-home /PATH/SOMEWHERE/ \
--key-file /etc/ssl/private/DOMAIN.TLD.key \
--fullchain-file /etc/ssl/private/DOMAIN.TLD.fullchain.pem \
--reloadcmd "service nginx reload" \
--staging
```
make sure your /etc/nginx/sites-enabled/domain.tld.conf has server_name set, or it wont validate
```
    server_name example.com;
```
