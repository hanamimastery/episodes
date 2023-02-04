## [Unreleased]

## [0.1.0] - 2023-01-03

- Initial release

Added initial structure, with basic depdendencies. Gem uses dry-system + zeitwerk for
dependency management and file loading.

### Features

**Unshot episode**
Removes shot marks from a given article (i.e. ""[🎬 01] ")

**Touch**
Updates the modifiedAt with the current date

## [0.2.0] - 2023-01-19

- PRO command

Added new command to render HTML version of premium episodes.

### Features

**PRO**
Transformes episode's markdown into HTML ready to be used in Podia editor.
