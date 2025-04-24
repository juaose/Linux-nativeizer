#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "❌ Usage: $0 <AppImage file>"
  exit 1
fi

APPIMAGE_PATH="$1"
APPIMAGE_FILE=$(basename "$APPIMAGE_PATH")
APPIMAGE_NAME="${APPIMAGE_FILE%.AppImage}"

APP_DIR="$HOME/.local/apps/$APPIMAGE_NAME"
DESKTOP_FILE="$HOME/.local/share/applications/${APPIMAGE_NAME}.desktop"
SYMLINK="/usr/local/bin/${APPIMAGE_NAME%%-*}" # e.g., 'Cursor' from 'Cursor-0.49.4-x86_64'

echo "📦 Extracting AppImage: $APPIMAGE_FILE"
chmod +x "$APPIMAGE_PATH"
"$APPIMAGE_PATH" --appimage-extract

echo "🚚 Moving extracted files to: $APP_DIR"
rm -rf "$APP_DIR"
mv squashfs-root "$APP_DIR"

echo "🔗 Creating symlink: $SYMLINK -> $APP_DIR/AppRun"
sudo ln -sf "$APP_DIR/AppRun" "$SYMLINK"

echo "🧾 Creating desktop entry at: $DESKTOP_FILE"
mkdir -p "$(dirname "$DESKTOP_FILE")"

cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Type=Application
Name=$APPIMAGE_NAME
Exec=$SYMLINK
Icon=electron
Terminal=false
Categories=Development;IDE;
EOF

update-desktop-database "$(dirname "$DESKTOP_FILE")" || true

echo "✅ Done! You can run '${SYMLINK##*/}' from terminal or search for '$APPIMAGE_NAME' in your menu."
