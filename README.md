Before starting `init` script:
```
xcode-select --install
```

These need to be done manually:
- You should check that firmware security settings are set to [Full Security](https://support.apple.com/guide/mac-help/change-security-settings-startup-disk-a-mac-mchl768f7291/mac) to prevent tampering with your OS. This is the default setting.
- Activate FileVault
- Use a firewall
- Start Zen and then use scripts/add_arkenfox.sh to harden zen
