# RPG Manager

This is a simple app for tracking health of multiple characters in a tabletop roleplaying game.

## Current Features

* Add/remove characters to an encounter
* Track hit points in the encounter
* Manage multiple encounters
* Encounters have a single narrator, the creator of the encounter
* Encounters have multiple players

One of the aims of this app is to use websockets to maintain connections between the different players' browsers. This is being used to keep hit points updated when they change, and to provide a log of notifications.

## Improvements to Make

* Make encounters private or public
* Narrator can invite player to private encounter
* Players can create characters
* Players can use character in multiple encounters
* Create campaign, belonging to narrator and players, containing multiple encounters
