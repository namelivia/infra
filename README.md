# Infra [![Ansible Lint](https://github.com/namelivia/infra/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/namelivia/infra/actions/workflows/ansible-lint.yml)

## About

This repository contains the code to build, deploy and manage my personal infrastructure. It all started with an old laptop on a chair in a corner of the room manually configured and has evolved over time. This repository represents the current state of it and it will keep evolving as my needs change or whenver I discover better ways of doing things. The value for you could be mostly educational as you probably don't want to replicate all my infrastructure as your needs will most likely be diffrent.

These are some of the key features that shape the project:

 - **Everything is a Docker container**: All apps are containerized and deployed as Docker containers in order to facilitate the deployment and the interchanging of containers between machines.
 - **All is backed up on S3**: In order to avoid data loss, databases and filesystems are periodically compressed, encrypted using restic and stored on S3.
 - **It's cloud-agnostic**: To avoid vendor lock-in it is all about linux machines running Docker containers, I tried to avoid cloud specific configuration so I can move applications from one provider or even my own physical servers.

## Features

Interactive UI to perform focused deployments

![screenshot](https://github.com/namelivia/infra/assets/1571416/1dd7d73d-bbb7-4b4a-9892-1952ce3069dd)

Monitoring integrated in Grafana

![screenshot](https://github.com/namelivia/infra/assets/1571416/e22bf156-0fd5-466e-bcea-c9e0479bf42a)

Automatic backups in S3

![screenshot](https://user-images.githubusercontent.com/1571416/194699813-48a95656-7129-4d77-9409-66c51652efe3.png)

Endpoint monitoring using UptimeRobot

![screenshot](https://user-images.githubusercontent.com/1571416/194699867-1e3db96f-7181-4616-820e-1549bd6ca430.png)

Authenticated applications managed by [Pomerium](https://www.pomerium.com)

## Usage

Execute `./run` and select the desired actions. The script will ask you to install `jq` and `gum` if you don't have them installed.

## Topolgy

This reflects the current state of the infrastructure, it has evolved from different models and will change according to my needs. The main driver of the current structure was to take advantage of free tiers of cloud providers, however I've run out of credits in
most of them and costs have been ramping up so probably it will evolve to a cheaper model. The Raspberry Pi + VPN configuration is what I envisioned as the future of the topolgy but currently there are still some problems to be solved with that.

![diagram](https://github.com/namelivia/infra/assets/1571416/f407e4ba-a2a4-49e7-b11e-065b34ecae44)

## Application list

- [flappysonic](https://github.com/namelivia/flappysonic/): Runs the website for the game [Flappysonic](https://flappysonic.namelivia.com).
- [thumbor](https://github.com/thumbor/thumbor): [Image processing service](thumbor.org) for other elements on the infrastructure.
- [tombraiderjs](https://github.com/namelivia/tomb-raider-js-demo-site): Runs the website for the demo of [TombRaiderJs](https://tombraiderjs.namelivia.com).
- [movie quote twitter bot](https://github.com/namelivia/movie-quote-twitter-bot/): Runs [Battle Royale Movie Quotes Twitter Bot](https://twitter.com/BRBot_en).
- [like and share twitter bot](https://github.com/namelivia/like-and-share-twitter-bot/): Makes [Battle Royale Movie Quotes Twitter Bot](https://twitter.com/BRBot_en) interact with people.
- [anki](https://github.com/ankicommunity/anki-sync-server): Runs an instance of [Anki](https://apps.ankiweb.net/) Sync Server, an open source flashcard application.
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
- [mealie](https://github.com/hay-kot/mealie): [Mealie](https://hay-kot.github.io/mealie/) is a self hosted recipe manager.
- [jackett](https://github.com/Jackett/Jackett): Tracker proxy server
- [sonarr](https://github.com/Sonarr/Sonarr): [Sonarr](https://github.com/Sonarr/Sonarr) is a series collection manager.
- [lidarr](https://github.com/Lidarr/Lidarr): [Lidarr](https://github.com/Lidarr/Lidarr) is a music collection manager.
- [radarr](https://github.com/Radarr/Radarr): [Radarr](https://radarr.video/) is a movie colection manager.
- [deluge](https://github.com/deluge-torrent/deluge): [Deluge](https://deluge-torrent.org) is a torrent client.
- [amule](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjsi-SShNP2AhUMMewKHRE3BawQFnoECAYQAQ&url=https%3A%2F%2Fgithub.com%2Famule-project%2Famule&usg=AOvVaw08pianVkOSDYC8tRsyaNgG): [Amule](https://www.amule.org/) is an EDonkey network client.
- [ofelia](https://github.com/mcuadros/ofelia): Job scheduler.
- [miniflux](https://github.com/miniflux/miniflux): Rss server.
- [pleroma](https://pleroma.social/): Social networking software.
- [apprise](https://github.com/caronc/apprise): Notifications microservice.
- [immich](https://github.com/immich-app/immich): Picture manager.
- [dashy](https://github.com/lissy93/dashy): Dashboard.
- [mealie-discord](https://github.com/namelivia/mealie-discord): Discord Bot to ask what's for lunch.
- [cadvisor](https://github.com/google/cadvisor): cAdvisor to monitor containers.
- [prometheus](https://github.com/prometheus/prometheus): Prometheus to gather metrics.
- [grafana](https://grafana.com/): Grafana to display metrics.
- [loki](https://grafana.com/oss/loki/): Loki to store logs.
- [funkwhale](https://funkwhale.audio/): Funkwhale for listening to music.
- [babybuddy](https://github.com/babybuddy/babybuddy): Baby habits tracker.
- [tink-firefly-endpoint](https://github.com/namelivia/tink-firefly-endpoint): Retrieve information from Tink and push it to Firefly, endpoint part.
- [firefly iii](https://www.firefly-iii.org/): A free and open source personal finance manager.
- [restic](https://restic.net): Restic as a backup program.
- [metube](https://github.com/alexta69/metube): Self-hosted YouTube downloader.
- [navidrome](https://www.navidrome.org/):  Self-hosted, open source music server and streamer.
- [slsdk](https://github.com/slskd/slskd/): A modern client-server application for the Soulseek file sharing network. 
- [soularr](https://soularr.net/): A Python script that connects Lidarr with Soulseek.
