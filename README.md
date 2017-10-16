# RPG Manager

This is a simple app for tracking health of multiple characters in a tabletop roleplaying game.

Part of the objective of this app is to learn more about websockets using ActionCable. It uses websockets to keep information up to date on all players' screens, and to provide any other updates necessary.

## Current Features

* Make encounters private or public
* Notifications when players join or leave an encounter
* Add/remove characters to an encounter
* Track hit points in the encounter
* Manage multiple encounters
* Encounters have a single narrator, the creator of the encounter
* Encounters have multiple players

One of the aims of this app is to use websockets to maintain connections between the different players' browsers. This is being used to keep hit points updated when they change, and to provide a log of notifications.

## Improvements to Make

* Narrator can invite player to private encounter
* Players can create characters
* Players can use character in multiple encounters
* Create campaign, belonging to narrator and players, containing multiple encounters
