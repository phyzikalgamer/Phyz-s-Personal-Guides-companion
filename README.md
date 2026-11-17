# Phyz Personal Guides

A lightweight setup companion for [Phyz Leveling](https://github.com/phyzikalgamer/Phyz-s-Leveling-Addon) on **World of Warcraft: Forever**.

The companion gives you a copyable guide website address and opens Phyz Leveling's existing manual importer. **No guides or encrypted imports are included.**

## Install

1. Install and enable Phyz Leveling.
2. Download this repository using **Code → Download ZIP** and extract it.
3. Copy the `PhyzPersonalGuides` folder into your Forever client's `Interface/AddOns/` folder.
4. Confirm the path is `Interface/AddOns/PhyzPersonalGuides/PhyzPersonalGuides.toc`.
5. Fully restart WoW and enable **Phyz Personal Guides**.

If you already have an older personal-import companion, back up its folder outside `AddOns` and replace it with this one. This version does not load the old `Import.lua` file.

## Add guides

1. Type `/phyzguides` or `/ppg`.
2. Copy the website address with **Ctrl+C** and open it in your browser: [xp.bulo.cloud](https://xp.bulo.cloud/).
3. Follow the website's instructions to obtain an import for your own account.
4. Return to WoW and click **Open guide importer**.
5. Paste the import into Phyz Leveling's importer, follow its prompts, and select your guide in Phyz Leveling.

`/phyzguides import` opens the importer directly. Phyz Leveling's `/phyzleveling import` command is also available.

## Requirements and limits

- Targets Forever interface `16001`.
- Phyz Leveling must be installed and enabled to import guides.
- WoW addons cannot download files from websites. Downloads and any website sign-in happen in your browser.
- The companion does not detect, collect, or transmit your Battle.net identity.
- Guide decoding, account checks and storage remain with Phyz Leveling. Account-specific imports must match the account using them.
- The website is a separate service; this companion does not verify its availability or the guide content it provides. Use guide content you are authorised to access.

## Troubleshooting

**Importer does not open:** enable Phyz Leveling, finish combat and try `/phyzleveling import`. Restart WoW after installing or changing addon manifests.

**Account mismatch or invalid import:** obtain a complete import for the correct account. The companion does not change or bypass import validation.

## Licence

Companion code is released under the [MIT licence](LICENSE). Guide content and third-party services are not covered by this licence.
