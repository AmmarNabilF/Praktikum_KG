
void setup() { //inisaisi ukuran kanvas
  size(750,500);//ukuran kanvas 750 x 750
  smooth(1); //mengaktifkan anti-aliasing sehingga mengurangi pixellated
}

void draw(){ //inisiasi objek yg akan terus di ekseksi
  strokeWeight(4);//membuat ketebalan garis untuk tinggi akuarium yg terisi
  //tangki akuarium
  fill(#13A1D3);//warnai air menjadi biru
  rect(115,100,535,300,5,5,5,5);//persegi untuk tangki air
  noFill();//mencegah objek selanjutnya terisi warna yang sama
  noStroke();//menghilangkan warna garis tepi
  fill(255);//membuat persegi atas menjadi kosong dan putih
  rect(115,100,535,150,5,5,5,5);//membuat persegi atas sebagai representasi tangki yang tidak terisi penuh
  noFill();//mencegah objek lain terisi warna yang sama
  point(375,250);//penentu titik tengah dari rectangle utama
  
  //batas air
  stroke(0);//memnampilkan ketebalan garis dengan warna hitam
  strokeWeight(2);//menebalkan garis tepi objek
  line(115,250,650,250);//membuat batas ketinggian air
  
  //iwak1 cuy
  fill(#868273);
  ellipse(200,350,60,20);// badan iwak
  point(230,350);// titik temu ekor
  triangle(230,350,260,340,260,360);// ekor iwak
  circle(180,350,5);// mata iwak
  
  //iwak2 cuy
  ellipse(400,290,60,20);// badan iwak
  point(430,290);// titik temu ekor
  triangle(430,290,460,280,460,300);// ekor iwak
  circle(380,290,5);// mata iwak
  
  //iwak3 cuy
  ellipse(500,350,60,20);// badan iwak
  point(530,350);// titik temu ekor
  triangle(530,350,560,340,560,360);// ekor iwak
  circle(480,350,5);// mata iwak
  
  //tanaman air
  point(120,400);//tentukan patokan ketinggian
  fill(#107910);//mwarnai tanmanan air jadi hijau
  beginShape(TRIANGLES);//memulai objek agar menjaid segitiga1
  vertex(120,400); vertex(130,300); vertex(140,400);//kumpulan titik sudut dari segitiga1
  vertex(140,400); vertex(150,350); vertex(160,400);//kumpulan titik sudut dari segitiga1 yang kecil
  vertex(160,400); vertex(170,330); vertex(180,400);//kumpulan titik sudut dari segitiga1
  endShape(CLOSE);//mengakhiri objek duplikat segitiga1
  
  beginShape(TRIANGLES);//memulai objek agar menjadi duplikat segitiga2
  vertex(320,400); vertex(330,300); vertex(340,400);//kumpulan titik sudut dari segitiga2
  vertex(340,400); vertex(350,350); vertex(360,400);//kumpulan titik sudut dari segitiga2 yang kecil
  vertex(360,400); vertex(370,330); vertex(380,400);//kumpulan titik sudut dair segitiga2 
  endShape(CLOSE);//mengakhiri objek duplikat segitiga2
 
  beginShape(TRIANGLES);//memulai objek agar menjadi duplikat segitiga3
  vertex(420,400); vertex(430,300); vertex(440,400);//kumpulan titik sudut dari segitiga3
  vertex(440,400); vertex(450,350); vertex(460,400);//kumpulan titik sudut dari segitiga3 yang kecil
  vertex(460,400); vertex(470,330); vertex(480,400);//kumpulan titik sudut dari segitiga3
  endShape(CLOSE);//mengakhiri objek duplikat segitiga3
 
  beginShape(TRIANGLES);//memulai objek agar menjadi duplikat4
  vertex(585,400); vertex(595,300); vertex(605,400);//kumpulan titik sudut dari segitiga4
  vertex(605,400); vertex(615,350); vertex(625,400);//kumpulan titik sudut dari segitiga4 yang kecil
  vertex(625,400); vertex(635,330); vertex(645,400);//kumpulan titik sudut dari segitiga4
  endShape(CLOSE);//mengakhiri objek agar menjadi duplikat4
  
  //buat batu hias
  fill(#DCE00B);//warna kuning
  arc(235, 390, 30, 18, 0, TWO_PI, OPEN);//batukiri
  fill(#025CCE);//warna biru
  arc(265, 390, 30, 18, 0, TWO_PI, OPEN);//batukanan
  fill(#DE4C02);//warna orange
  arc(250, 375, 30, 18, 0, TWO_PI, OPEN);//batuatas
  
  fill(#DCE00B);//warna kuning
  arc(505, 390, 30, 18, 0, TWO_PI, OPEN);//batukiri
  fill(#025CCE);//warna biru
  arc(535, 390, 30, 18, 0, TWO_PI, OPEN);//batukanan
  fill(#DE4C02);//warna orange
  arc(520, 375, 30, 18, 0, TWO_PI, OPEN);//batuatas
  
  //membuat animasi gelembung
  int d;//variabel d

  d = frameCount;//naik terus tiap frame (halus)
  
  noFill();//mengosongkan warna dalam objek

  // Gelembung 1
  float y1 = 380 - (d * 3.5) % (400 + 60);//menentukan posisi gelembung 1
  float r1 = 10 + 10 * sin(d * 0.055);//menentukan luas lingkaran gelembung 1 dan bisa kembang kempis
  if (y1 > 250) {//kondisi gelembung tetap muncul hingga menyentuh ketinggian 250 maka akan menghilang/meleduk
    strokeWeight(2);//ketebalan gelembung
    ellipse(235, y1, r1, r1);//membuat gelembung dengan posisi dan jari jari yg ditentukan
    stroke(0);//mengatur warna ketebalan tepi gelembung
  }
  
  // Gelembung 2
  float y2 = 380 - (d * 5.5) % (400 + 60);//menentukan posisi gelembung 2
  float r2 = 10 + 10 * sin(d * 0.055);//menentukan luas lingkaran gelembung 2 dan bisa kembang kempis
  if (y2 > 250) {//kondisi gelembung tetap muncul hingga menyentuh ketinggian 250 maka akan menghilang/meleduk
    strokeWeight(2);//ketebalan gelembung
    ellipse(450, y2, r2, r2);//membuat gelembung dengan posisi dan jari jari yg ditentukan
    stroke(0);//mengatur warna ketebalan tepi gelembung
  }
  
  // Gelembung 3
  float y3 = 380 - (d * 2.5) % (400 + 60);//menentukan posisi gelembung 3
  float r3 = 10 + 10 * sin(d * 0.055);//menentukan luas lingkaran gelembung 3 dan bisa kembang kempis
  if (y3 > 250) {//kondisi gelembung tetap muncul hingga menyentuh ketinggian 250 maka akan menghilang/meleduk
    strokeWeight(2);//ketebalan gelembung
    ellipse(530, y3, r3, r3);//membuat gelembung dengan posisi dan jari jari yg ditentukan
    stroke(0);//mengatur warna ketebalan tepi gelembung
  }
  
  // Gelembung 4
  float y4 = 380 - (d * 4.5) % (400 + 60);//mene4tukan posisi gelembung 4
  float r4 = 10 + 10 * sin(d * 0.055);//menentukan luas lingkaran gelembung 4 dan bisa kembang kempis
  if (y4 > 250) {//kondisi gelembung tetap muncul hingga menyentuh ketinggian 250 maka akan menghilang/meleduk
    strokeWeight(2);//ketebalan gelembung
    ellipse(630, y4, r4, r4);//membuat gelembung dengan posisi dan jari jari yg ditentukan
    stroke(0);//mengatur warna ketebalan tepi gelembung
  }
  
 //makanan iwak1
 float yfood = 250 + (d*0.5);//posisi y makanan iwak bertambah saat jatuh
 float xfood = 200 + (d*0.1) % (300 + 10);//posisi x makanan iwak per frame
 if (yfood < 380){//kondisi jika makanan iwak sampai di bawah
   strokeWeight(4);//mengatur ketebalan makanan iwak
   point(xfood, yfood);//point yang menggunakan nilai xfood dan yfood
 }
 
 //makanan iwak2
 float yfood2 = 250 + (d*0.5);//posisi y makanan iwak bertambah saat jatuh
 float xfood2= 300 + (d*0.1) % (100 + 10);//posisi x makanan iwak per frame
 if (yfood2 < 380){//kondisi jika makanan iwak sampai di bawah
   strokeWeight(4);//mengatur ketebalan makanan iwak
   point(xfood2, yfood2);//point yang menggunakan nilai xfood dan yfood
 }
 //makanan iwak3
 float yfood3 = 250 + (d*0.5);//posisi y makanan iwak bertambah saat jatuh
 float xfood3= 400 + (d*0.01) % (150 + 10);//posisi x makanan iwak per frame
 if (yfood3 < 380){//kondisi jika makanan iwak sampai di bawah
   strokeWeight(4);//mengatur ketebalan makanan iwak
   point(xfood3, yfood3);//point yang menggunakan nilai xfood dan yfood
 }
}
