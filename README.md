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
