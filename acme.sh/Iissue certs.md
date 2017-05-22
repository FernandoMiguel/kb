Based on [acme.sh](https://acme.sh) client for [Let's Encrypt](https://letsencrypt.org/)

## install
```
curl https://get.acme.sh | sh

acme.sh --update-account --accountemail "foobar@example.com"
```


## issue
get Cloudflare API key from https://www.cloudflare.com/a/account/my-account

```
export CF_Key="sdfsdfsdfljlbjkljlkjsdfoiwje"
export CF_Email="xxxx@example.com"

acme.sh --issue --dns dns_cf -d example.com --dnssleep 10 --ocsp \
--keylength ec-256 --ecc \
--key-file /etc/ssl/private/DOMAIN.TLD.key \
--fullchain-file /etc/ssl/private/DOMAIN.TLD.fullchain.pem \
--reloadcmd "service nginx reload"

```
