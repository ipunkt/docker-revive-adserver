# Revive Adserver in a Docker infrastructure
This project aims to have a usable, updatable installation of the [revive adserver](https://www.revive-adserver.com) in a docker infrastructure.

## Targets
1. Install, setup and run the current revive-version
 * database following upgradable naming conventions [see Upgrade instructions](https://www.revive-adserver.com/support/upgrading/) (might be external or included)
2. Detect version missmatch (container / connected Database) on start and solve by upgrading if new database exists
 * `_Mmp` is the version suffix for the `DB_NAME`.
 * If the ENV says we have `_401` and our container says we should have `_410` we have a upgrade situation
 * check if DB `_410` exists OR exit
 * if `_410` is not empty and has the 4.1.0 installed, change ENV-VAR DB_NAME to `_410`
 * if `_410` is empty, follow [upgrade instructions](https://www.revive-adserver.com/support/upgrading/)
