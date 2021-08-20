# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- PriorityClasses for osds/mons ([#42](https://github.com/giantswarm/rook-operator-app/pull/42)).
- Subchart to manage the cluster resources (uses upstream chart) ([#40](https://github.com/giantswarm/rook-operator-app/pull/40)).
- Make the Ceph version configurable from the main chart's values ([#40](https://github.com/giantswarm/rook-operator-app/pull/40)).
- Extended UPDATING.md to reflect the additional subchart ([#40](https://github.com/giantswarm/rook-operator-app/pull/40)).

### Changed

- Disable CephFS CSI driver by default ([#43](https://github.com/giantswarm/rook-operator-app/pull/43)).

## [1.1.0] - 2021-08-06

### Changed

- Updated upstream chart to Rook `v1.7.0` ([#34](https://github.com/giantswarm/rook-operator-app/pull/34))
- Restrict the app to KVM clusters only ([#35](https://github.com/giantswarm/rook-operator-app/pull/35))

## [1.0.0] - 2021-08-04

### Added

- Add alerting rules for managed Ceph clusters ([#31](https://github.com/giantswarm/rook-operator-app/pull/31)).
- Add servicemonitor to enable monitoring on MCs ([#30](https://github.com/giantswarm/rook-operator-app/pull/30)).

### Changed

- Promoted `rook-operator-app` to the main `giantswarm-catalog` ([#32](https://github.com/giantswarm/rook-operator-app/pull/32)).

## [0.3.3] - 2021-07-29

### Changed

- Revert 'Ensure the app is deployed to the correct namespace on MCs'.

## [0.3.2] - 2021-07-29

### Fixed

- Ensure the app is deployed to the correct namespace on MCs.

## [0.3.1] - 2021-07-29

## [0.3.0] - 2021-07-28

### Added

- Push to control-plane-catalog and kvm-app-collection ([#21](https://github.com/giantswarm/rook-operator-app/pull/21)).
- Add a global toggle to enable/disable all resources in the chart ([#22](https://github.com/giantswarm/rook-operator-app/pull/22)).

### Removed

- Remove -app suffix from chart name ([#24](https://github.com/giantswarm/rook-operator-app/pull/24)).

## [0.2.0] - 2021-07-27

### Changed

- Synced chart with upstream at `v1.6.8` ([#16](https://github.com/giantswarm/rook-operator-app/pull/16)).

## [0.1.0] - 2021-04-22

### Added

- Initial release tracking [rook/rook](https://github.com/rook/rook) at `v1.5.9`.

[Unreleased]: https://github.com/giantswarm/rook-operator-app/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/giantswarm/rook-operator-app/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/giantswarm/rook-operator-app/compare/v0.3.3...v1.0.0
[0.3.3]: https://github.com/giantswarm/rook-operator-app/compare/v0.3.2...v0.3.3
[0.3.2]: https://github.com/giantswarm/rook-operator-app/compare/v0.3.1...v0.3.2
[0.3.1]: https://github.com/giantswarm/rook-operator-app/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/giantswarm/rook-operator-app/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/giantswarm/rook-operator-app/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/giantswarm/rook-operator-app/releases/tag/v0.1.0
