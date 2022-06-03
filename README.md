# Infra [![Ansible Lint](https://github.com/namelivia/infra/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/namelivia/infra/actions/workflows/ansible-lint.yml)

## About

This repository contains the code to build, deploy and manage my personal infrastructure. It all started with an old laptop on a chair in a corner of the room manually configured and has evolved over time. This repository represents the current state of it and it will keep evolving as my needs change or whenver I discover better ways of doing thigs. The value for you could be mostly educational as you probably don't want to replicate all my infrastructure as your needs will probably be diffrent.

These are some of the key features that shape the project:

 - **Everything is a Docker container**: All apps are containerized and deployed as Docker containers in order to facilitate the deployment and the interchanging of containers between machines.
 - **All is backed up on S3**: In order to avoid data loss, databases and filesystems are periodically compressed, encrypted using GPG and stored on S3.
 - **All logs go to Cloudwatch**: All logs of all applications are sent to an external provider.
 - **It's cloud-agnostic**: To avoid vendor lock-in it is all about linux machines running Docker containers, I tried to avoid cloud specific configuration so I can move things from one provider or even my own physical server.

## Usage

Run `./build` to build all containers, and `./run` to let Terraform create the infrastructure and Ansible provision it.

## Topolgy

This reflects the current state of the infrastructure, it has evolved from different models and will change according to my needs. The main driver of the current structure was to take advantage of free tiers of cloud providers, however I've run out of credits in
most of them and costs have been ramping up so probably it will evolve to a cheaper model. The Raspberry Pi + VPN configuration is what I envisioned as the future of the topolgy but currently there are still some problems to be solved with that.

![diagram](https://user-images.githubusercontent.com/1571416/171875350-2614995c-4f75-44b0-839a-031a74eb224c.png)

## Application list

- [humancoop](https://github.com/humancoop/web-vue): Runs the website for the organization [Humancoop](https://onghumancoop.org).
- [flappysonic](https://github.com/namelivia/flappysonic/): Runs the website for the game [Flappysonic](https://flappysonic.namelivia.com).
- [nightcityride](https://github.com/namelivia/nightcityride-server/): Runs the website for the artistic project [Nightcityride](https://nightcityride.namelivia.com).
- [thumbor](https://github.com/thumbor/thumbor): [Image processing service](thumbor.org) for other elements on the infrastructure.
- [tombraiderjs](https://github.com/namelivia/tomb-raider-js-demo-site): Runs the website for the demo of [TombRaiderJs](https://tombraiderjs.namelivia.com).
- [movie quote twitter bot](https://github.com/namelivia/movie-quote-twitter-bot/): Runs [Battle Royale Movie Quotes Twitter Bot](https://twitter.com/BRBot_en).
- [like and share twitter bot](https://github.com/namelivia/like-and-share-twitter-bot/): Makes [Battle Royale Movie Quotes Twitter Bot](https://twitter.com/BRBot_en) interact with people.
- [anki](https://github.com/ankicommunity/anki-sync-server): Runs an instance of [Anki](https://apps.ankiweb.net/) Sync Server, an open source flashcard application.
- [haproxy](https://github.com/haproxy/haproxy): Runs [Haproxy](http://www.haproxy.org/) for redirecting certain traffic from the outside world to instances on the VPN.
- [nextcloud](https://github.com/nextcloud/server): An instance of [Nextcloud](https://nextcloud.com/) a self hosted productivity platform.
- [kimai](https://github.com/kevinpapst/kimai2): Runs an instance of [Kimai](https://www.kimai.org/) a self-hosted time tracking tool.
- [pomermium](https://github.com/pomerium/pomerium): Runs [Pomerium](https://www.pomerium.com/) to act as the access-proxy for certain apps.
- [postgres](https://github.com/postgres/postgres): Even though some apps run their own databases ther is a [Postgres](https://www.postgresql.org/) instance shared by some apps.
- [gallery client](https://github.com/namelivia/gallery-client/): Client part of a simple image gallery app.
- [gallery server](https://github.com/namelivia/gallery-server/): Server part of a simple image gallery app, images stored on S3.
- [plants client](https://github.com/namelivia/plants-client/): Client part of a simple plant care app.
- [plants server](https://github.com/namelivia/plants-server/): Server part of a simple plant care app.
- [itemtree client](https://github.com/namelivia/itemtree-client/): Client part of a simple inventory app.
- [itemtree server](https://github.com/namelivia/itemtree-server/): Server part of a simple inventory app.
- [expenses client](https://github.com/namelivia/expenses-client/): Client part of an expenses management app.
- [expenses server](https://github.com/namelivia/expenses-server/): Server part of an expenses management app.
- [garments client](https://github.com/namelivia/garments-client/): Client part of an clothing management app.
- [garments server](https://github.com/namelivia/garments-server/): Server part of an clothing management app.
- [journaling service](https://github.com/namelivia/journaling-service/): Journaling service to store events from multiple apps.
- [user info service](https://github.com/namelivia/user-info-service): User information service to mange user information shared among apps.
- [notifications service](https://github.com/namelivia/notifications-service): Notifications service to send notifications from apps to messaging services.
- [mealie](https://github.com/hay-kot/mealie): [Mealie](https://hay-kot.github.io/mealie/) is a self hosted recipe manager.
- [jackett](https://github.com/Jackett/Jackett): Tracker proxy server
- [sonarr](https://github.com/Sonarr/Sonarr): [Sonarr](https://github.com/Sonarr/Sonarr) is a series collection manager.
- [radarr](https://github.com/Radarr/Radarr): [Radarr](https://radarr.video/) is a movie colection manager.
- [deluge](https://github.com/deluge-torrent/deluge): [Deluge](https://deluge-torrent.org) is a torrent client.
- [amule](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjsi-SShNP2AhUMMewKHRE3BawQFnoECAYQAQ&url=https%3A%2F%2Fgithub.com%2Famule-project%2Famule&usg=AOvVaw08pianVkOSDYC8tRsyaNgG): [Amule](https://www.amule.org/) is an EDonkey network client.
- [ofelia](https://github.com/mcuadros/ofelia): Job scheduler.
