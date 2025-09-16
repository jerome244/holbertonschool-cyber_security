DNS — Domain Name System
The internet’s phonebook: turns names like example.com into IP addresses so computers know where to connect.

TLD — Top-Level Domain
The ending of a domain name (.com, .org, .fr). TLD servers help point your lookup to the right place.

TTL (DNS) — Time To Live
How long a DNS answer may be cached (in seconds). Example: TTL 3600 = “you can reuse this answer for 1 hour.”

UDP — User Datagram Protocol
A fast, lightweight way to send data without a full connection. Classic DNS uses UDP on port 53 (it’s quick but not guaranteed).

DoH — DNS over HTTPS
Sends DNS queries inside encrypted HTTPS traffic (usually port 443). Hides DNS from easy snooping and blocks.

TLS — Transport Layer Security
The encryption that gives you the browser lock icon. It keeps data private and tamper-proof between you and a website (HTTPS), and also secures things like DoT (DNS over TLS).

How they fit together (one sentence)

You type site.com → DNS (often over UDP 53, or encrypted via DoH/TLS 443) finds the IP → your browser connects with TLS (HTTPS) so the page loads securely → the DNS answers are cached for their TTL → .com is the TLD in that name.






Short answer: some are protocols, some aren’t.

Term	Protocol?	What it is (1-liner)	Where it lives
DNS	Yes	Application-layer protocol + distributed database that maps names → IPs.	App layer (uses UDP/TCP, sometimes TLS/HTTPS)
TLD	No	“Top-Level Domain” like .com/.fr; a naming level, not a protocol.	Part of DNS namespace
TTL (DNS)	No	“Time To Live”: a setting/field on DNS records that controls cache duration (seconds).	DNS record metadata
UDP	Yes	Transport protocol (connectionless) that classic DNS uses on port 53.	Transport layer
DoH	Yes	“DNS over HTTPS”: DNS queries carried inside HTTPS (TLS) on port 443.	App layer over HTTPS
TLS	Yes	Encryption/authentication protocol used by HTTPS, DoH, DoT, etc.	Security layer above transport

Memory hook:

Protocols: DNS, UDP, TLS, DoH.

Not protocols: TLD (it’s a label tier), TTL (it’s a timer/field).