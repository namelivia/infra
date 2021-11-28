# Infra

## About

This repository contains the code to build, deploy and manage my personal infrastructure.

## Usage

Run `./build` to build all containers, and `./run` to let Terraform create the infrastructure and Ansible provision it.

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
