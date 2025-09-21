//Klik mouse untuk menjatuhkan makanan
//Tekan spasi untuk membuat gelombang air

int delay = 0; //inisiasi delay untuk tombol spasi
float xFood, yFood;  //deklarasi tipe data lokasi makanan akan jatuh
boolean aktif,gelombang = false; //flag untuk menyatakan true or false dalam kondisi mengeluarkan makanan dan gelombang
float tGelombang = 0; //inisiasi kecepatan gelombang 
float v = 3; //inisiasi kecepatan makanan jatuh diatas air
float Ybatas1 = 100; //batas atas area untuk menekan mouse
float Ybatas2 = 380; //batas bawah area untuk menekan mouse
float Xbatas1 = 100; //batas kiri area untuk menekan mouse
float Xbatas2 = 640; //batas kanan area untuk menekan mouse

float xGelembung, yGelembung, vGelembung, r; //deklarasi koordinat, kecepatan dan jari jari gelembung

void alatBantu(){ //prosedur untuk menampilkan koordinat tetikus
  fill(0); //mengisi warna latar belakang menjadi hitam
  noStroke(); //menghilangkan garis tepi
  rect(0,0,70,15); //membuat kotak area informasi koordinat
  fill(255); //memutihkan output teks
  text("X:"+mouseX+" Y:"+mouseY, 5, 10); //menampilkan teks yang akan diwarnai putih
}

void mouseClicked(){ //prosedur jika mouse diklik
  if(mouseY > Ybatas1 && mouseY < Ybatas2 && mouseX > Xbatas1 && mouseX < Xbatas2){ //kondisi dalam membatasi area mouse
    xFood = mouseX; //lokasi makanan x adalah koordinat x dari mouse
    yFood = mouseY; //lokasi makanan y adalah koordinat y dari mouse
    aktif = true; //makanan akan muncul karena true saat di klik
  }
  else{ //tidak akan menjatuhkan makanan ketika diklik diluar area akuarium
    aktif = false; //makanan tidak jadi mmuncul
  }
  println("tombol mouse kiri ditekan"); //output terminal ketika mouse ditekan
 
}

void keyPressed(){ //prosedur spasi ditekan
  println("spasi ditekan"); //menampilkan output terminal ketika spasi ditekan
  if (key == ' ') { //kondisi jika menekan spasi
    gelombang = true; //gelombang akan aktif
    delay = 0; //menghilangkan efek delay
  }
}

void keyReleased(){ //prosedur spasi dilepas
  if (key == ' ') { //jika yang dilepas adalah spasi
    delay = millis() + 2000; //memberikan efek delay 2 detik lebih sedikit
  }
}

void setup() { //inisaisi ukuran kanvas
  size(750,500);//ukuran kanvas 750 x 750
  smooth(3); //mengaktifkan anti-aliasing sehingga mengurangi pixellated
  
  xGelembung = random(120,640); //mengacak lokasi x gelembung akan muncul dalam range tertentu
  yGelembung = random(100,400); //mengacak lokasi y gelembung akan muncul dalam range tertentu
  vGelembung = random(1.5, 4.5); //mengacak kecepatan gelembung naik dalam range tertentu
}

void draw(){ //inisiasi objek yg akan terus di ekseksi
  alatBantu(); //memanggil prosedur alat bantu
  strokeWeight(2);//membuat ketebalan garis untuk tinggi akuarium yg terisi
  
  //tangki akuarium
  fill(#13A1D3); //warnai air menjadi biru
  stroke(0); //menghilangkan warna garis tepi
  rect(110,100,540,300); //persegi untuk tangki air
  noFill(); //mencegah objek selanjutnya terisi warna yang sama
  fill(255); //membuat persegi atas menjadi kosong dan putih
  noStroke(); //menghilangkan garis tepi
  rect(112,100,537,150); //membuat persegi atas sebagai representasi tangki yang tidak terisi penuh
  point(375,250); //penentu titik tengah dari rectangle utama
  
  //batas air bergelombang
  stroke(0); //memnampilkan ketebalan garis dengan warna hitam
  strokeWeight(2); //menebalkan garis tepi objek
  
  if (gelombang){ //kondisi ketika gelombang bernilai true
    tGelombang += 1; //akan menambah kecepatan gelombang
    beginShape(); //membuat objek ombak
    fill(#13A1D3); //mengisi warna objek
    noStroke();  //menghapus garis tepi ombak
    for (float x = 655; x >= 105; x -= 5) { //perulangan yang terus berjalan hingga jarak ombak lebih kecil dari 105
      float y = 250 + 30 * sin(radians(x + tGelombang)); //mengatur naik turun dan cepatnya gelombang bergerak
      curveVertex(x, y); //membuat gelombang dengan curveVertex yang memiliki argumen dari nilai x dan y 
    }
    vertex(112, 400); //membuat titik bawah kiri agar warna sepenuhnya biru
    vertex(647, 400); //membuat titik bawah kanan agar warna sepenuhnya biru
    
    endShape(CLOSE); //menutup pembuatan objek dan mempertemukan titik titik vertex
    if (delay > 0 && millis() > delay){ //memberikan kondisi delay jika melebihi 0 dan ms melebihi 0
      println(delay +"ms" + " spasi dilepas"); //maka akan menampilkan output waktu delay saat ini dan spasi telah dilepas
      gelombang  = false; //memberikan flag false sehingga gelombang mati
      delay = 0; //membuat delay menjadi  0 kembali agar menghentikan efek kondisi If
    }
  }
  
  stroke(0); //memberikan tepi hitam pada objek selain ombak
  
  //iwak1 cuy
  fill(#868273); //memberi warna pada iwak1 iwak2 iwak3
  beginShape(); //memulai membuat objek
  vertex(170, 350); //titik patokan kepala
  bezierVertex(185, 340, 215, 340, 230, 350); //curve bagian punggung
  bezierVertex(215, 360, 185, 360, 170, 350); //curve bagian punggung
  endShape(CLOSE); //memnutup objek dna menghubungkan titik vertex
  point(230,350);// titik temu ekor
  triangle(230,350,260,340,260,360);// ekor iwak
  circle(180,350,5);// mata iwak
  
  //iwak2 cuy
  beginShape();
  vertex(370, 290); //titik tumpu kepala
  bezierVertex(385, 275, 415, 275, 430, 290); //curve bagian punggung
  bezierVertex(415, 305, 385, 305, 370, 290); //curve bagian punggung
  endShape(CLOSE); //menutup objek dan menghubungkan titik vertex
  point(430,290);// titik temu ekor
  triangle(430,290,460,280,460,300);// ekor iwak
  circle(380,290,5);// mata iwak
  
  //iwak3 cuy
  beginShape();
  vertex(470, 350); //titik tumpu kepala
  bezierVertex(485, 340, 515, 340, 530, 350); //curve bagian punggung
  bezierVertex(515, 360, 485, 360, 470, 350); //curve bagian punggung
  endShape(CLOSE); //menutup objek dan menghubungkan titik vertex
  point(530,350);// titik temu ekor
  triangle(530,350,560,340,560,360);// ekor iwak
  circle(480,350,5);// mata iwak
  
  //tanaman air
  point(120,400);//tentukan patokan ketinggian
  fill(#107910);//mwarnai tanmanan air jadi hijau
  
  beginShape();//memulai objek agar menjaid segitiga1
  vertex(120,400); vertex(130,300); vertex(140,400);//kumpulan titik sudut dari segitiga1
  vertex(140,400); vertex(150,350); vertex(160,400);//kumpulan titik sudut dari segitiga1 yang kecil
  vertex(160,400); vertex(170,330); vertex(180,400);//kumpulan titik sudut dari segitiga1
  endShape();//mengakhiri objek duplikat segitiga1
  
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
  yGelembung -= vGelembung; //membuat lokasi gelmbung ke atas karena dikurang kecepatan gelembung
  
  if (yGelembung < 250){ //kondisi terpenuhi jika tinggi gelembung kurang dari 250
    yGelembung = 380; //mengatur titik spawn gelembung
    xGelembung = random(130, 630); //lokasi x gelembung yang diacak dalam range tertentu
    vGelembung = random(2.5, 4.5); //kecepatan gelembung yang diacak dalam range tertentu
  }
  
  r = 10 + 10 * sin(d*0.055); //membuat gelembung kembang kempis setiap frame
  
  ellipse(xGelembung, yGelembung, r,r); //membuat objek gelembung berdasarkan argumen yang sudah memperoleh nilainya
  
 //makanan iwak
 if (aktif){ //makanan ikan true
   strokeWeight(4); //mengatur ketebalan garis tepi makanan
   yFood += 0.8; //kecepatan jatuh makanan didalam air melambat
   point(xFood, yFood); //pembuatan titik menjadi makanan berdasarkan lokasi mouse ditekan
   if (yFood >= Ybatas1 && yFood <= Ybatas2 && xFood >= Xbatas1 && xFood <= Xbatas2){ //kondisi jika dimunculkan di area akuarium
     aktif = true; //mengubah flag aktif menjadi true
     if (yFood <= 250){ //jika makanan dijatuhkan di atas permukaan air
       yFood += v; //maka makanan akan lebih cepat untuk jatuh
     }
   }
   else{ //jika tidak memenuhi kondisi
     aktif = false; //makanan tidak akan muncul
   }
 }
}
