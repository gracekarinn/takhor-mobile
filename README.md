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


# Tugas 9

**1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?**

Membuat model untuk pengambilan atau pengiriman data JSON sangat penting karena model membantu dalam memvalidasi dan memastikan data yang diterima atau dikirim sesuai dengan format yang diinginkan. Tanpa model, kita harus melakukan validasi dan pengolahan data secara manual setiap kali berinteraksi dengan data JSON yang bisa memperbesar risiko kesalahan dan ketidaksesuaian data. Model juga memungkinkan pengolahan data yang lebih terstruktur, memudahkan pemetaan data JSON ke objek dalam kode, dan memastikan bahwa data tersebut dapat diproses dengan aman. Meskipun tanpa model aplikasi masih dapat berjalan, namun pengelolaan data menjadi lebih rawan kesalahan, lebih sulit dipelihara, dan berpotensi menyebabkan bug jika ada data yang tidak sesuai.


**2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini**

Library `http` yang diimplementasikan pada tugas ini berfungsi untuk memfasilitasi pengiriman dan penerimaan data melalui protokol HTTP antara aplikasi dan server. Library ini memungkinkan aplikasi untuk mengirim permintaan seperti GET, POST, PUT, atau DELETE untuk mengambil, mengirim, memperbarui, atau menghapus data. Selain itu, library ini juga menangani respons yang diterima dari server, termasuk status kode dan data dalam format yang sesuai, seperti JSON. Fungsi lainnya adalah menyederhanakan proses komunikasi jaringan, mengelola header dan body dari permintaan atau respons, serta memudahkan pengolahan data yang dikirim dan diterima. Dengan menggunakan library ini, aplikasi dapat berinteraksi dengan API atau server dengan cara yang lebih efisien dan terstruktur, tanpa perlu menulis kode yang kompleks untuk setiap permintaan HTTP.


**3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**

`CookieRequest` dalam konteks aplikasi Flutter berfungsi untuk mengelola dan mengirimkan cookie dalam permintaan HTTP. Cookie adalah data yang disimpan di browser atau perangkat pengguna yang dapat digunakan untuk menyimpan informasi penting seperti sesi pengguna atau preferensi aplikasi. `CookieRequest` bertanggung jawab untuk menangani cookie yang akan dikirim bersama permintaan HTTP ke server, serta memastikan bahwa cookie yang diterima dari server disimpan dan dikelola dengan benar di aplikasi.

Instance dari `CookieRequest` perlu dibagikan ke semua komponen di aplikasi Flutter karena banyak komponen atau bagian aplikasi yang mungkin perlu mengakses atau memperbarui cookie, seperti auth pengguna, dll. Dengan membagikan instance tersebut, kita memastikan bahwa seluruh aplikasi menggunakan cookie yang sama dan tetap konsisten. Misalnya, saat pengguna login, server mungkin mengirimkan cookie yang berisi informasi sesi, dan komponen lain di aplikasi perlu menggunakan cookie ini untuk memverifikasi status login atau akses ke data pengguna lainnya. 

Jika instance `CookieRequest` tidak dibagikan, maka setiap komponen mungkin memiliki salinan cookie yang terpisah, yang dapat menyebabkan inkonsistensi dalam pengelolaan sesi dan pengalaman pengguna yang buruk. Dengan membagikan instance tersebut, aplikasi dapat menjaga integritas dan keamanan data sesi, serta memastikan interaksi yang mulus antara komponen-komponen aplikasi yang berbeda.

**4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.**

Mekanisme pengiriman data dari Flutter ke Django dan sebaliknya:

1. Input Data (Flutter -> Django):
- User mengisi form di Flutter
- Data dikirim via HTTP POST request menggunakan CookieRequest
- Data dikonversi ke JSON 
- Django menerima request di view function
- Data divalidasi dan disimpan ke database

2. Menampilkan Data (Django -> Flutter):
- Flutter memanggil endpoint JSON Django
- Django mengambil data dari database
- Data dikonversi ke JSON menggunakan serializer
- Flutter menerima response JSON
- JSON di-parse ke model objects (ProductEntry)
- Data ditampilkan di UI menggunakan widgets

Contoh kode untuk kedua proses:

```dart
// Kirim data
onPressed: () async {
  final response = await request.postJson(
    "http://localhost:8000/create-flutter/",
    jsonEncode(<String, String>{
      'nama': nama,
      'harga': harga,
      // ... field lainnya
    }),
  );
}

// Ambil data
Future<List<ProductEntry>> fetchProducts() async {
  final response = await request.get('http://localhost:8000/json/');
  return List<ProductEntry>.from(
    response.map((x) => ProductEntry.fromJson(x))
  );
}
```


**5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**

Mekanisme autentikasi dari Flutter ke Django:

1. Login:
```dart
// Flutter - Login Form
final response = await request.login(
  "http://localhost:8000/auth/login/",
  {
    'username': username,
    'password': password,
  }
);

if (response['status']) {
  Navigator.pushReplacement(...); // Ke homepage jika berhasil
}
```

```python
# Django - Login View
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        login(request, user)
        return JsonResponse({
            "status": True,
            "message": "Login successful!"
        })
    return JsonResponse({
        "status": False,
        "message": "Login failed!"
    })
```

2. Register:
```dart
// Flutter - Register Form
final response = await request.post(
  "http://localhost:8000/auth/register/",
  {
    'username': username,
    'password': password,
  }
);

if (response['status']) {
  Navigator.pushReplacement(...); // Ke login page jika berhasil
}
```

```python 
# Django - Register View
@csrf_exempt
def register(request):
    form = UserCreationForm(request.POST)
    if form.is_valid():
        form.save()
        return JsonResponse({
            "status": True,
            "message": "Register successful!"
        })
    return JsonResponse({
        "status": False,
        "message": "Register failed!"
    })
```

3. Logout:
```dart
// Flutter - Logout
final response = await request.logout(
  "http://localhost:8000/auth/logout/"
);

if (response['status']) {
  Navigator.pushReplacement(...); // Ke login page
}
```

```python
# Django - Logout View
@csrf_exempt
def logout(request):
    logout(request)
    return JsonResponse({
        "status": True,
        "message": "Logout successful!"
    })
```

Proses:
1. User input credentials di Flutter
2. Data dikirim ke Django endpoint
3. Django autentikasi user
4. Django kirim response status
5. Flutter redirect sesuai status
6. Session disimpan via cookies untuk request selanjutnya

Django menggunakan decorators @login_required untuk proteksi views yang membutuhkan autentikasi.


**6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).**

1. Setup Django & Flutter
# Django 
- Buatlah django-app bernama authentication pada project Django.
- Tambahkan authentication ke INSTALLED_APPS pada main project settings.py aplikasi Django kamu.
- Menambahkan corsheaders pada `MIDDLEWARE' dan `INSTALLED_APPS`. Kemudian, menambahkan beberapa variabel cors pada `settings.py`

2. Authentication Django
```python
# views.py
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user:
        login(request, user)
        return JsonResponse({"status": True})
    return JsonResponse({"status": False})
```

3. Integrasi Flutter
```dart
// Install packages
flutter pub add provider
flutter pub add pbp_django_auth

// main.dart
void main() {
  runApp(Provider(
    create: (_) => CookieRequest(),
    ...
  ));
}
```

4. Login Page Flutter
```dart
onPressed: () async {
  final response = await request.login(
    "http://<URL>/auth/login/",
    {
      'username': username,
      'password': password, 
    }
  );
  
  if (response['status']) {
    Navigator.pushReplacement(...);
  }
}
```

5. Model & Form
```dart
class ProductEntry {
  String model;
  String pk;
  Fields fields;

  ...
  
  factory Fields.fromJson(Map<String, dynamic> json) => Fields (
    ...
    name = json['name'];
    price = json['price'];
    description = json['description'];
    ...
  );
}

// Form submit
final response = await request.postJson(
  "http://<URL>/create-flutter/",
   jsonEncode(<String, String>{
   'nama': _namaController.text,
   'harga': _hargaController.text,
   'stok': _stokController.text,
   'deskripsi': _deskripsiController.text,
   'image_url': _imageUrl ?? '',
);
```

6. Integrasi Form dengan CookieRequest
```dart
final request = context.watch<CookieRequest>();

onPressed: () async {
  if (_formKey.currentState!.validate()) {
    final response = await request.postJson(...);
    if (response['status'] == 'success') {
      Navigator.pushReplacement(...);
    }
  }
}
```

7. Logout
```dart
onPressed: () async {
  final response = await request.logout("http://<URL>/auth/logout/");
  ...
  if (response['status']) {
    Navigator.pushReplacement(...); 
  }
}
```

8. JSON Endpoint
```python
@login_required
def show_json(request):
    products = Product.objects.filter(user=request.user)
    return JsonResponse(serializers.serialize('json', products))
```









