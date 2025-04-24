# AppImage Native-izer 🧊➡️🖥️

**Turn any `.AppImage` into a near-native Linux application** — extract, install, symlink, and register it with your system.  
No mounting, no weird loop devices, no root installs (except for optional symlink). Perfect for developers who like clean, portable setups.

---

## ⚙️ Features

- ✅ Extracts and installs `.AppImage` files to `~/.local/apps/{AppName-Version}`
- ✅ Creates a global CLI symlink in `/usr/local/bin`
- ✅ Registers a `.desktop` entry for full menu/search integration
- ✅ Works with any Linux distro
- ✅ Requires root **only for the symlink** (optional but recommended)
- ✅ Version-aware: easily install and switch between app versions

---

## 🧰 Usage

```bash
chmod +x install_appimage.sh
./install_appimage.sh /path/to/YourApp-x.y.z-x86_64.AppImage
```

For example:

```bash
./install_appimage.sh ~/installers/Cursor-0.49.4-x86_64.AppImage
```

---

## 📂 What This Does

Given the above input, the script will:

| Task | Result |
|------|--------|
| 🧵 Extract AppImage | Creates `squashfs-root/` |
| 📁 Move Files | Installs to `~/.local/apps/Cursor-0.49.4-x86_64/` |
| 🔗 Create Symlink | `/usr/local/bin/cursor` → `AppRun` inside the app |
| 🧾 Create Desktop Entry | Launchable from application menus or search bar |

You can now run the app via:

```bash
cursor
```

Or launch it from your desktop environment like any other native app.

---

## 🧼 Uninstall

To remove an app:

```bash
rm -rf ~/.local/apps/{AppName-Version}
sudo rm /usr/local/bin/{appname}
rm ~/.local/share/applications/{AppName-Version}.desktop
```

---

## 🛟 Why This?

AppImages are fantastic for portability, but they're often clunky to manage.  
This script gives you the **best of both worlds**:  
✅ Portability + 🧼 Native Feel + 🧠 Zero system clutter

---

## 📝 License

MIT — free for all sailors of open seas and open source.

---

## 💬 Maintainer

Built by [Captain Jack](https://github.com/juaose) for pragmatic pirates and Linux lovers.  
Raise a flag or submit an issue if you hit rough waters ⚓
