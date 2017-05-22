basic vhost for modern nginx with TLS certs provided by Cloudflare Origin Certificates

based on
https://support.cloudflare.com/hc/en-us/articles/218408028-How-to-install-an-Origin-CA-Certificate-Other-

```
server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    # certs sent to the client in SERVER HELLO are concatenated in ssl_certificate
    ssl_certificate /etc/ssl/private/DOMAIN.TLD.Cloudflare.pem;
    ssl_certificate_key /etc/ssl/private/DOMAIN.TLD.Cloudflare.key;
    ssl_session_timeout 1d;
    ssl_session_cache shared:SSL:50m;
    ssl_session_tickets off;


    # modern configuration. tweak to your needs.
    # ciphers from https://github.com/cloudflare/sslconfig/blob/master/conf
    ssl_protocols TLSv1.2;
    ssl_ciphers EECDH+CHACHA20:EECDH+CHACHA20-draft:EECDH+AES128:RSA+AES128:EECDH+AES256:RSA+AES256:EECDH+3DES:RSA+3DES:!MD5;
    ssl_prefer_server_ciphers on;

    # HSTS (ngx_http_headers_module is required) (15768000 seconds = 6 months)
    add_header Strict-Transport-Security max-age=15768000;

    ....
}
```
