# Termux CCMiner untuk Vivo Y81 1808

Based on: https://github.com/Darktron/ccminer

Repositori ini merupakan adaptasi ccminer pada Termux untuk penambangan koin Verus dengan menggunakan mesin Vivo Y81 (1808).

Meskipun begitu, tidak menutup kemungkinan digunakan pada mesin lain dengan spesifikasi yang mirip.
Kunci utama dari konfigurasi repositori ini adalah koin Verus, Android 7 dan chipset Cortex A53.

Jika ingin menggunakan hape untuk menambang koin selain Verus, harap melakukan riset terlebih dahulu dan melakukan penyesuaian-penyesuaian yang diperlukan.

Mesin dengan Android 5 dan 6 tidak bisa menggunakan repositori ini karena perbedaan versi Termux dan begitu pula paket-paket pendukungnya.

Mesin dengan chipset selain Cortex A53 masih mungkin menggunakan repositori ini dengan merubah parameter di berkas configure.sh sebelum melakukan kompilasi ccminer. 
Langkah lebih jelas tertulis di bawah.

Bagi siapapun yang menggunakan repositori ini, jangan sampai lupa merubah parameter di berkas config.json.
Utamanya alamat dompet Verus, pool maupun nama worker.

Tanpa lebih banyak fafifu dan wasweswos, mari meracik mesin cuan..

Sebelum meracik ccminer, install Termux arm64-v8a versi 118 : https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_arm64-v8a.apk

Untuk cek rilis Termux terbaru : https://github.com/termux/termux-app/releases

Lanjutkan dengan instalasi, konfigurasi dan kompilasi. Jalankan baris perintah-perintah berikut pada Termux :

1. Memasang clang dan paket-paket lain yang diperlukan:
```
yes | pkg update && pkg upgrade -y
```
```
yes | pkg install libjansson build-essential clang binutils git -y
```

2. Atur environment & kloning repo:
```
cp /data/data/com.termux/files/usr/include/linux/sysctl.h /data/data/com.termux/files/usr/include/sys
```
```
git clone https://github.com/mahaskoro/ccminer-v1808.git
```
```
cd ccminer-v1808
```
```
chmod +x build.sh configure.sh autogen.sh start.sh
```

Untuk selain Chipset Cortex A53, lakukan langkah berikut sebelum langkah selanjutnya
```
nano configure.sh
```

3. Kompilasikan ccminer:
```
CXX=clang++ CC=clang ./build.sh
```

4. Tes miner:
   Sebelum melakukan tes, atur dulu pool, dompet dan nama worker
```
nano config.json
```
   Berikutnya lakukan tes hasil kompilasi miner:

```
~/ccminer-v1808/start.sh
```

5. BONUS!!
   Atur agar ccminer dipanggil setelah gawai booting dan langsung nambang
```
cd && cd && cd && nano ../usr/etc/bash.bashrc
``` 
   Salin perintah ini kebaris paling bawah;
```
cd ccminer-v1808/&&./start.sh
``` 
