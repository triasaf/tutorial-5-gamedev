### Tutorial 5 - Assets Creation & Integration - Trias 2106633645

#### Objek Baru: Flying Blue Alien
- Menggunakan spritesheet dari kenney. Terdapat 2 animasi: Fly dan Idle
- Secara random bergerak ke kiri, kanan, atau diam
- Dalam jarak 500px dari Player, akan terdengar audio Alien. Dilakukan dengan cara mengubah max distance di Inspector
- Audio looping

#### Interaksi dengan Player
- Dalam script Alien ditambahkan move_and_collide() untuk deteksi collision dengan Player
- Jika terdeteksi collision, akan stop audio default Alien, dan play audio collision, lalu kembali ke audio default
- Terkadang collision detection kurang konsisten

#### Background Music
- Menambahkan background music seperti pada instruksi latihan
---

### Tutorial 3 - Movement - Trias 2106633645

#### Movement:
- Double jump
- Dash ketika di tanah 
- Dash ketika di udara

#### Double Jump
Terdapat boolean yg menjadi kondisi apakah bisa double jump. Nilai boolean akan berganti apabila player lompat

#### *Dash menggunakan Shift
#### Dash ketika di tanah
Memberi velocity yang besar ke player dalam durasi terbatas. Menggunakan ease function agar terdapat feel seperti braking di akhir dash

#### Dash ketika di udara
Konsep yang sama dengan dash di tanah, tetapi memberi delay sedikit agar terdapat penekanan airdash, dan tidak dikenakan ease function

#### Dash Cooldown
Terdapat dash cooldown 1 detik yang ikut menjadi kondisi apakah player dapat melakukan dash
