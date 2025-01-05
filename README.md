# Termux CCMiner untuk Rolex Nougat

Based on: https://github.com/Darktron/ccminer

Repositori ini merupakan adaptasi ccminer pada Termux untuk penambangan koin Verus dengan menggunakan mesin Redmi 4A Rolex Cortex A53 Quad-Core dengan O.S. Android Nougat.
Agar bisa dimanfaatkan untuk menambang, O.S. Redmi 4A Rolex harus di-update terlebih dulu hingga minimal Android 7.0 karena Termux versi stabil belum tersedia untuk O.S. dibawah Android 7.0. 

Untuk update O.S. pada Redmi 4A Rolex gunakan fastboot dengan MiFlash :

https://xiaomiflashtool.com/latest

dan fastboot-rom versi stable (saat repo ini ditulis adalah versi V10.2.3.0.NCCMIXM) :

https://xiaomirom.com/en/rom/redmi-4a-rolex-global-fastboot-recovery-rom/#download-redmi-4a-stable-fastboot-rom

Untuk cara update O.S. Redmi 4A Rolex lakukan dengan cara EDL. Tutorial sementara bisa dicari sendiri.

Bagi siapapun yang menggunakan repositori ini, jangan sampai lupa merubah parameter di berkas config.json.
Utamanya alamat dompet Verus, pool maupun nama worker.

Tanpa lebih banyak fafifu dan wasweswos, mari meracik mesin cuan..

Sebelum meracik ccminer, install Termux arm64-v8a versi 118 :

https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_arm64-v8a.apk

Untuk cek rilis Termux terbaru : 

https://github.com/termux/termux-app/releases

Lanjutkan dengan instalasi, konfigurasi dan kompilasi. Jalankan baris perintah-perintah berikut pada Termux :
1. Update repository paket yang ada;
```
yes | pkg update && pkg upgrade -y
```

2. Memasang clang dan paket-paket lain yang diperlukan:
```
yes | pkg install libjansson build-essential git -y
```

3. Atur environment, lalu kloning repo:
```
cp /data/data/com.termux/files/usr/include/linux/sysctl.h /data/data/com.termux/files/usr/include/sys
```
```
git clone https://github.com/mahaskoro/ccminer-rolex.git
```
```
cd ccminer-rolex
```
```
chmod +x build.sh configure.sh autogen.sh start.sh
```

   Untuk selain Chipset Cortex A53, lakukan langkah berikut sebelum langkah selanjutnya
```
nano configure.sh
```

4. Kompilasikan ccminer:
```
CXX=clang++ CC=clang ./build.sh
```

5. Tes miner:

   Sebelum melakukan tes, atur dulu pool, dompet dan nama worker
```
nano config.json
```
   Berikutnya lakukan tes hasil kompilasi miner:

```
~/ccminer-rolex/start.sh
```

6. BONUS!!

   Atur agar ccminer langsung nambang setelah dipanggil oleh triger auto-start
```
cd && cd && cd && nano ../usr/etc/bash.bashrc
``` 
   Salin perintah ini kebaris paling bawah;
```
cd ccminer-rolex/&&./start.sh
``` 
   Untuk triger auto-start bisa digunakan Automation :

https://f-droid.org/id/packages/com.jens.automation2/

   atau software apa saja yang penting berfungsi untuk memanggil termux setelah mesin nyala.

Tinggal merakit agar ketika ada arus listrik mesin otomatis menyala -> auto-start -> nambang.

Selamat menambang bahan tambang galian c++ ...
