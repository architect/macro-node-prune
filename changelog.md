# Architect node-prune macro changelog

---

## [1.0.3] 2020-11-25

### Changed

- Uses Inventory and Utils 2.0

---

## [1.0.2] 2020-03-29

### Added

- Add `__mocks__` and `__test__` dirs to prune

---

## [1.0.1] 2020-03-28

### Fixed

- Fixes issue where pruner may be passed an project with functions that do not (yet) exist on the filesystem (potentially due to default `get /`, or other possible mutations by other macros)

---

## [1.0.0] 2020-03-08

### Added

- Architect node-prune is now a v6-compatible macro
  - Ported from the now-deprecated [v5-compatible plugin](https://github.com/architect/arc-plugin-node-prune)
  - Fixes @arc-plugin-node-prune#7; thanks to @alexbepple for the kick in the pants!
- Improved file counting and formatting of output along the way

---

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
