# ⚡ TWRP Flash Guide — Lava Play Ultra 5G

<div align="center">

![Device](https://img.shields.io/badge/Device-Lava%20Play%20Ultra%205G-red?style=for-the-badge&logo=android)
![Method](https://img.shields.io/badge/Method-Fastboot-blue?style=for-the-badge)
![Partition](https://img.shields.io/badge/Partition-vendor__boot-orange?style=for-the-badge)

</div>

---

> ## 🚨 WARNING — READ BEFORE PROCEEDING
>
> - ❌ **Do NOT attempt this if you have never flashed a custom recovery before.** Practice on a device you are willing to risk first.
> - ⚠️ This device uses a **MediaTek (MTK) SoC** — it does NOT behave like a Snapdragon device. Do not assume Snapdragon knowledge applies here.
> - 💀 Flashing wrong files or skipping steps **can permanently brick your device.**
> - 📵 **I am not responsible for any damage, data loss, bootloops, or bricks.** You proceed entirely at your own risk.
>
> **Read the entire guide before starting. Do not skip any step.**

---

## 📋 Prerequisites

Before starting, make sure you have the following ready:

- USB Debugging enabled on your device
- ADB & Fastboot installed on your PC → [Download Platform Tools](https://developer.android.com/studio/releases/platform-tools)
- Stock `vbmeta.img`, `vbmeta_system.img`, and `vbmeta_vendor.img` from your stock firmware
- Custom `vendor_boot.img` (TWRP build) downloaded from the [Releases](../../releases/latest) page

---

## 🔓 Step 1 — Unlock Bootloader

> 💡 If your bootloader is already unlocked, skip to Step 2.

**Enable Developer Options and OEM Unlocking:**
1. Go to **Settings → About Phone**
2. Tap **Build Number** 7 times until you see *"You are now a developer!"*
3. Go to **Settings → System → Developer Options**
4. Enable **OEM Unlocking** ✅
5. Enable **USB Debugging** ✅

**Reboot to bootloader and unlock:**
```bash
adb reboot bootloader
fastboot flashing unlock
```

On your device screen, use Volume Up to confirm and Volume Down to cancel.

> After running unlock command it nothing showing, just press Vol- button one time under 5 Sec.
> ⚠️ **Unlocking the bootloader will wipe all data on your device. Back up everything first.**

After unlocking, complete the initial device setup, then re-enable Developer Options and USB Debugging before continuing.

---

## 🛡️ Step 2 — Disable Verified Boot (vbmeta)

This step disables Android Verified Boot so TWRP can boot correctly:

```bash
fastboot flash vbmeta --disable-verity --disable-verification vbmeta.img
fastboot flash vbmeta_system --disable-verity --disable-verification vbmeta_system.img
fastboot flash vbmeta_vendor --disable-verity --disable-verification vbmeta_vendor.img
```

> ✅ These `.img` files are found inside your extracted stock firmware folder.

---

## 💾 Step 3 — Backup All Partitions

**Always back up before flashing anything.**

Use MTK Client or SP Flash Tool to read back all partitions and store them somewhere safe. This backup is your only way back if something goes wrong.

---

## 🚀 Step 4 — Flash TWRP Recovery

Reboot to bootloader:
```bash
adb reboot bootloader
```

**Flash to the active slot (recommended):**
```bash
fastboot flash vendor_boot vendor_boot.img
```

**Or flash to the inactive slot only:**

If you are currently on Slot A, flash to Slot B:
```bash
fastboot flash vendor_boot_b vendor_boot.img
```

If you are currently on Slot B, flash to Slot A:
```bash
fastboot flash vendor_boot_a vendor_boot.img
```

**Boot into TWRP without permanently flashing (test first):**
```bash
fastboot boot vendor_boot.img
```

---

## ↩️ Step 5 — Restore Stock Recovery

If you want to go back to stock recovery, rename your backed-up `vendor_boot_a.img` or `vendor_boot_b.img` to `vendor_boot_stock.img` and flash it:

```bash
adb reboot bootloader
fastboot flash vendor_boot vendor_boot_stock.img
fastboot reboot
```

For a full stock ROM restore, follow the dedicated restore guide:
👉 [RESTORE_GUIDE.md](https://github.com/sumankr29/lava_lxx521_recovery/blob/main/RESTORE_GUIDE.md)

---

## 💬 Support

If you face any issues, join the Telegram support channel:

[![Telegram](https://img.shields.io/badge/Telegram-Support%20Channel-blue?style=for-the-badge&logo=telegram)](https://t.me/lava_play_ultra)

---

<div align="center">

Made with ❤️ by kotler-m2, for the community.

</div>
