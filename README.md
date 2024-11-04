# Tugas 7

**1.Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.**

Stateless widget adalah widget yang sifatnya statis atau tidak berubah. Setelah widget ini dibuat, data atau properti di dalamnya tidak bisa diubah selama aplikasi berjalan. Stateless Widget cocok digunakan untuk tampilan yang tidak memerlukan perubahan data, seperti text label, icon, atau tampilan statis lainnya. Widget ini lebih ringan dalam hal performa karena tidak perlu melakukan rebuild ketika ada perubahan data. Sedangkan, stateful widget adalah widget yang sifatnya dinamis dan bisa berubah. Widget ini memungkinkan adanya perubahan data atau properti selama aplikasi berjalan. Stateful Widget memiliki objek State yang terpisah untuk mengelola data yang bisa berubah. Ketika data berubah, widget akan melakukan rebuild untuk memperbarui tampilan. Widget ini cocok digunakan untuk komponen yang memerlukan interaksi dengan pengguna seperti form input, counter, atau tampilan yang membutuhkan pembaruan data secara real-time.

**2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.**

1. **Scaffold**
   - Widget dasar yang menyediakan struktur layout visual 
   - Menyediakan framework untuk mengimplementasikan struktur layout dasar seperti AppBar, Body, dll

2. **AppBar**
   - Widget yang menampilkan bar di bagian atas aplikasi
   - Berisi judul aplikasi "Takhor" dengan warna latar belakang indigo

3. **SingleChildScrollView**
   - Widget yang memungkinkan konten dapat di-scroll
   - Mencegah overflow ketika konten melebihi ukuran layar

4. **Padding**
   - Widget yang memberikan jarak/ruang kosong di sekitar widget child-nya
   - Digunakan untuk memberikan spacing yang konsisten

5. **Column**
   - Widget yang menata children-nya secara vertikal
   - Digunakan untuk menata judul dan grid tombol-tombol

6. **Text**
   - Widget untuk menampilkan teks
   - Digunakan untuk judul dan label tombol
   - Memiliki properti style untuk mengatur tampilan teks (ukuran, warna, weight)

7. **GridView.count**
   - Widget yang menata children dalam bentuk grid
   - Mengatur layout tombol-tombol dalam 3 kolom
   - Properti seperti crossAxisSpacing dan mainAxisSpacing mengatur jarak antar item

8. **Material**
   - Widget yang memberikan efek visual material design
   - Memberikan warna latar belakang dan border radius pada tombol

9. **InkWell**
   - Widget yang memberikan efek ripple ketika ditekan
   - Menangani interaksi tap/sentuh pada tombol

10. **Container**
    - Widget yang membungkus dan mengatur tata letak widget lain
    - Memberikan padding dan mengatur alignment konten di dalamnya

11. **Center**
    - Widget yang menempatkan child-nya di tengah
    - Digunakan untuk mengatur posisi konten dalam tombol

12. **Icon**
    - Widget untuk menampilkan ikon
    - Digunakan untuk menampilkan ikon pada setiap tombol (list_alt, add_shopping_cart, logout)

13. **ScaffoldMessenger**
    - Widget yang mengelola SnackBar
    - Digunakan untuk menampilkan pesan feedback ketika tombol ditekan

14. **SnackBar**
    - Widget yang menampilkan pesan singkat di bagian bawah layar
    - Memberikan feedback kepada pengguna saat tombol ditekan

**3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.**

Fungsi setState() adalah metode yang digunakan dalam Flutter untuk memberi tahu framework bahwa telah terjadi perubahan pada internal state yang mungkin memengaruhi UI. Ketika setState() dipanggil, Flutter akan menjalankan ulang method build dari widget dan memperbarui tampilan dengan nilai terbaru dari variabel yang telah diubah.
setState() hanya dapat digunakan pada StatefulWidget, tidak pada StatelessWidget. Ini karena StatefulWidget dirancang untuk mengelola state yang dapat berubah selama widget tersebut ada, sementara StatelessWidget bersifat statis dan tidak dapat berubah setelah dibuat. Variabel yang dapat terdampak oleh setState() adalah variabel yang dideklarasikan sebagai state dalam class State dari StatefulWidget. 

**4. Jelaskan perbedaan antara const dengan final.**

**const (Constant)**
const adalah modifier yang digunakan untuk menyatakan variabel yang nilainya bersifat konstan dan harus ditentukan pada saat kompilasi (compile-time constant). Artinya, nilai variabel harus sudah diketahui sebelum program dijalankan. const membuat objek menjadi deeply immutable - artinya objek dan semua properti di dalamnya tidak dapat diubah.

**final**
final adalah modifier yang digunakan untuk menyatakan variabel yang nilainya hanya dapat diset satu kali dan setelah diinisialisasi tidak dapat diubah (runtime constant). Berbeda dengan const, nilai final dapat ditentukan saat runtime. final hanya membuat referensi variabel menjadi immutable, tapi tidak membuat objek yang direferensikan menjadi immutable.


**5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.**

- Menginstall keperluan untuk membuat proyek ini, yaitu flutter dan android studio
- Membuat project flutter dengan menjalankan perintah ```flutter create takhor_mobile``` dan pindah ke directory takhor_mobile
- Menjalankan ```flutter run``` untuk mengetahui installasi berjalan dengan baik
- Membuat file menu.dart dan memindahkan beberapa kode untuk merapikan stuktur dan menambahkan base warna pada proyek.```main.dart``` akan memiliki struktur kode seperti ini. 
  ```dart
  import 'package:flutter/material.dart';
  import 'package:takhor_mobile/menu.dart';
  
  void main() {
    runApp(const MyApp());
  }
  
  class MyApp extends StatelessWidget {
    const MyApp({super.key});
  
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
          ).copyWith(secondary: Colors.deepPurple[400]), // Mengubah warna color
          useMaterial3: true,
        ),
        home: MyHomePage(),
      );
    }
  }
  ```
- Pada main.dart, saya mengubah ```class MyHomePage``` dengan membuang semua kode dan mengubah state menjadi stateless widget karena untuk sementara ini masih bersifat statis
  ```dart
  class MyHomePage extends StatelessWidget {
    MyHomePage({super.key});

    @override
    Widget build(BuildContext context) {
    	return Scaffold(
    	);
        }
    }
  ```
  
- Membuat UI sederhana dengan fitur yang sudah dijelaskan di nomor 2 dan tampilan kode bisa dapat dilihat langsung pada ```lib/menu.dart```

