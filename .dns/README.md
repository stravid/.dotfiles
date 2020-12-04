# macOS

`brew install dnsmasq`

`cp ~/.dns/dnsmasq.conf $(brew --prefix)/etc/dnsmasq.conf`

`sudo brew services start dnsmasq`

Set DNS server to `127.0.0.1`

`sudo crontab -e`

`21,51 * * * * cp /Users/david/.dns/hosts /etc/hosts`
