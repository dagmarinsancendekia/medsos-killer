# Medsos Killer - USB Autorun Blocker

## Apa Ini?
Aplikasi USB autorun untuk blokir akses media sosial (Facebook, Instagram, Twitter/X, TikTok, Reddit, Roblox) dengan mengganti file `hosts` sistem Windows ke versi localhost redirect. Efek: Situs tidak bisa dibuka.

## Cara Pakai
1. **Copy project ke root USB drive** (seluruh folder `medsos-killer` di root USB).
2. **Tancapkan USB ke target PC**:
   - Jika autorun aktif: `medsoskiller.bat` akan terbuka otomatis → Klik **Jalankan Blocker** → Izinkan UAC Admin.
   - Manual: Double-click `medsoskiller.bat` (Run as Admin).
3. **Verifikasi**: Buka browser, coba facebook.com (harus gagal). Jalankan `ipconfig /flushdns` jika perlu.
4. **Revert**: Jalankan `penawar.bat` sebagai Admin.

## File Penting
- `hosts`: Payload blocker.
- `autorun.inf`: Trigger otomatis.
- `autorun.bat`: Salin + backup + flush DNS.
- `index.html`: GUI sederhana.
- `hosts_restore.bat`: Kembalikan backup.

## Catatan Penting ⚠️
- **Admin required**: UAC prompt muncul.
- **Backup otomatis**: `C:\Windows\System32\drivers\etc\hosts.backup`.
- **Autorun terbatas**: Windows modern mungkin tidak auto-run; gunakan manual.
- **Etis**: Gunakan untuk parental control/orang tua. Jangan untuk malware!
- **Test lokal**: Right-click `autorun.bat` → Run as administrator.
- **Undo**: Restore backup atau hapus entry manual di hosts.

## Test
```
# Di USB root
autorun.bat  (as admin)
```
Cek `C:\Windows\System32\drivers\etc\hosts` berubah.

Dikembangkan oleh BRQ DAGMAR FRAHADIXTA.
