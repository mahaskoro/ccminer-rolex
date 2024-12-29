# Termux CCMiner untuk Vivo Y81 1808

Based on: https://github.com/Darktron/ccminer

Install arm64-v8a Termux versi 118 : https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_arm64-v8a.apk

Untuk cek rilis Termux terbaru : https://github.com/termux/termux-app/releases

Lanjutkan dengan instalasi, konfigurasi dan kompilasi :

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
git clone https://github.com/mahaskoro/termux-ccminer-v1808.git
```
```
cd ccminer
```
```
chmod +x build.sh configure.sh autogen.sh start.sh
```

3. Kompilasikan ccminer:
```
CXX=clang++ CC=clang ./build.sh
```

4. Coba jalankan miner dengan perintah berikut:
```
~/ccminer/start.sh
```

5. BONUS
   Atur agar ccminer dipanggil setelah gawai booting dan langsung nambang
```
cd && cd && cd && nano ../usr/etc/bash.bashrc
``` 
   Salin perintah ini kebaris paling bawah;
```
cd ccminer/&&./start.sh
``` 
