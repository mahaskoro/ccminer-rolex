# Termux CCMiner untuk Cortex A53 Lolipop

Based on: https://github.com/Darktron/ccminer

Repositori ini merupakan adaptasi ccminer pada Termux untuk penambangan koin Verus dengan menggunakan mesin Cortex A53 Quad-Core Lolipop.

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
yes | pkg install libjansson build-essential git -y
```

2. Atur environment & kloning repo:
```
cp /data/data/com.termux/files/usr/include/linux/sysctl.h /data/data/com.termux/files/usr/include/sys
```
```
git clone https://github.com/mahaskoro/ccminer-a53loli.git
```
```
cd ccminer-a53loli
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
~/ccminer-a53loli/start.sh
```

5. BONUS!!
   Atur agar ccminer dipanggil setelah gawai booting dan langsung nambang
```
cd && cd && cd && nano ../usr/etc/bash.bashrc
``` 
   Salin perintah ini kebaris paling bawah;
```
cd ccminer-a53loli/&&./start.sh
``` 
