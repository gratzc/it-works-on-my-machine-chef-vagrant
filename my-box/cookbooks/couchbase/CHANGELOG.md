## v1.1.0

- Update to Couchbase 2.0.1.
- Add Test Kitchen 1.0.0 support and integration with Travis CI.
- [GH-2] Add a helper to check that Couchbase is actually up before trying to create buckets, etc.
- [GH-4] Allow SASL passwords to be used as bucket passwords
- [GH-7] Only set password if not set at other precedence levels. Also remove unnecessary node.save
- [GH-8] Added extra dep on libssl0.9.8 on Debian/Ubuntu
- [GH-9] Don't hardcode install_dir, use the node attribute instead
- [GH-10] Fix broken spec tests from GH-4
- [GH-11] Couchbase doesn't sign their packages, so on some RHEL distributions make sure we do --nogpgcheck

## v1.0.0

- Initial release
