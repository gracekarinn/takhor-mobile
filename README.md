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


# Tugas 8

**1.  Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?**

const pada Flutter memberi tahu Flutter bahwa nilai atau widget tersebut tidak akan berubah sama sekali selama aplikasi berjalan. Flutter kemudian akan membuat widget tersebut hanya sekali saat kompilasi dan menggunakan instance yang sama setiap kali widget itu dibutuhkan

Keuntungan menggunakan const adalah aplikasi kita bisa berjalan lebih cepat dan menggunakan memori lebih sedikit. Hal ini terjadi karena Flutter tidak perlu membuat widget baru setiap kali terjadi rebuild, melainkan bisa menggunakan widget yang sudah ada.

Kita sebaiknya menggunakan const pada widget atau nilai yang kita tahu pasti tidak akan berubah selama aplikasi berjalan. Contohnya seperti teks statis, padding, margin, atau widget dekorasi yang nilainya tetap. 

Kita tidak bisa menggunakan const pada widget yang nilainya bisa berubah atau bergantung pada state. Contohnya widget yang menampilkan data dari API, nilai yang berubah berdasarkan input pengguna, atau widget yang menggunakan fungsi seperti DateTime.now().

**2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!**

Column menyusun secara vertikal (atas ke bawah) sedangkan Row menyusun secara horizontal (kiri ke kanan).

```dart
Column(
  children: [
    Text('Item 1'), 
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```
Hasilnya akan tersusun ke bawah:
```
Item 1
Item 2  
Item 3
```
Kalau row
```dart
Row(
  children: [
    Text('Item 1'),
    Text('Item 2'), 
    Text('Item 3'),
  ],
)
```
Hasilnya akan tersusun ke samping:
```
Item 1  Item 2  Item 3
```

**3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!**

Pada tugas ini saya menggunakan elemen input TextFormField untuk input teks seperti Nama Produk (teks biasa), Harga (numerik), Stok (numerik), dan Deskripsi (multi-line), serta ImagePicker untuk input gambar produk.

Ada beberapa elemen input Flutter lain yang tidak digunakan seperti Checkbox & CheckboxListTile untuk pilihan boolean, Radio & RadioListTile untuk pilihan tunggal dari beberapa opsi, Switch & SwitchListTile untuk toggle on/off, Slider untuk nilai rentang, DropdownButton untuk pilihan dari daftar dropdown, DateTimePicker untuk input tanggal/waktu, RangeSlider untuk rentang nilai, Autocomplete untuk input dengan saran otomatis, SearchBar untuk pencarian, dan berbagai variasi TextField seperti password, email, dan phone input. Elemen-elemen ini tidak digunakan karena form produk yang dibuat cukup sederhana dan tidak memerlukan input-input tersebut.

**4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?**

Dalam aplikasi Flutter, kita dapat mengatur tema dengan menggunakan **ThemeData** di **MaterialApp** pada file ```main.dart```. 

Tidak. sebenarnya akan lebih baik jika menggunakan tema global melalui **ThemeData** untuk mendefinisikan semua style secara terpusat sehingga jika ingin mengubah tema cukup melakukannya di satu tempat saja. Namun pada implementasi saat ini masih menggunakan cara yang lebih sederhana dengan mendefinisikan style langsung pada masing-masing widget.

**5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?**

Dalam menangani navigasi aplikasi Flutter dengan banyak halaman, saya menggunakan Navigator untuk perpindahan antar halaman. Seperti pada tugas ini, saya menggunakan ```Navigator.pop(context)``` untuk kembali ke halaman sebelumnya setelah form produk disimpan. Kemudian, saya juga menggunakan ```Navigator.pushReplacement()``` untuk mengganti halaman saat ini dengan halaman baru

Terdapat juga navigasi melalui drawer (LeftDrawer) yang memungkinkan perpindahan ke berbagai halaman utama aplikasi. Untuk implementasi drawer, digunakan widget Drawer yang berisi daftar menu dalam bentuk ListTile, dimana setiap menu dapat mengarahkan ke halaman yang berbeda.






