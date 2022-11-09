# Tugas 7

 ## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
 _Stateless widget_ adalah suatu _widget_ yang tidak dapat diubah ketika _user_ berinteraksi dengannya, sedangkan _stateful widget_ adalah suatu _widget_ yang dapat diubah ketika _user_ berinteraksi dengannya. Oleh karena itu, _stateless widget_ bersifat _statis, sedangkan _stateful widget_ bersifat dinamis. Beberapa contoh dari _stateless widget_ adalah Icon, IconButton, dan Text, sedangkan beberapa contoh dari _stateful widget_ adalah Checkbox, Radio, dan Slider.

 ## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
 - Text: Untuk menampilkan suatu teks
 - Column: Untuk menempatkan _widget-widget_ secara vertikal
 - Row: Untuk menempatkan _widget-widget_ secara horizontal
 - Center: Untuk menempatkan _child_ di tengah
 - Padding: Untuk memberikan _padding_ atau _empty space_ di sekitar _widget_
 - FloatingActionButton: Untuk membuat suatu _button_ yang dapat melakukan suatu aksi
 - Spacer: Untuk memberikan jarak yang fleksibel antara children
 - Icon: Untuk memberikan _icon_ pada suatu _widget_
 
 ## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
 Fungsi `setState()` digunakan untuk memberi tahu pada _framework_ Flutter bahwa ada perubahan yang telah terjadi
 pada _state_ saat ini. Ketika terdapat perubahan, fungsi `setState()` akan melakukan _rebuild_ sehingga
 tampilan dapat menyesuaikan dengan perubahan yang ada. Sebagai contoh dalam program ini, terdapat variabel 
 `_counter` yang nilainya dapat berubah ketika dipencet _decrement button_ atau _increment button_. Karena 
 terlibatnya fungsi `setState()`, tampilan akan berubah menyesuaikan dengan nilai `_counter` yang telah berubah.
 
 ## Jelaskan perbedaan antara const dengan final.
`const` dan `final` sama-sama membuat suatu variabel _immutable_. Namun, kita tidak dapat menggunakan `const` untuk 
suatu variabel yang belum diketahui nilainya sebelum `runtime`. Untuk itu, kita perlu menggunakan `final`. `final` digunakan untuk membuat suatu variabel _immutable_ dengan nilai yang di-`assign` setelah _runtime_. Jika kita ingin
menggunakan `const`, kita harus meng-`assign` nilai dari suatu variabel yang ingin dibikin _immutable_ sebelum
_runtime_. Sebagai contoh, `const Text('GENAP', style: TextStyle(color: Colors.red))` dan `final String variable_name`.

 ## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
 1. Membuat suatu aplikasi Flutter bernama `counter_7` dengan menjalankan `flutter create counter_7`.
 2. Kemudian, edit lib/main.dart dengan melakukan hal berikut:
 - Menambahkan fungsi `_decrementCounter()`
    ```
    void _decrementCounter() {
        setState(() {
        if (_counter > 0) {
            _counter--;
        }
        });
    }
    ```

- Menambahkan kode untuk mengubah tampilan teks
    ```
        const Text(
        'GENAP',
        style: TextStyle(
            color: Colors.red,
        ),
        ),

    if (_counter % 2 == 1)
        const Text(
        'GANJIL',
        style: TextStyle(
            color: Colors.blue,
        ),
        ),
    ```

- Menambahkan kode untuk _increment button_ dan _decrement button_

    ```
    floatingActionButton:
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

                // show decrement button only if counter > 0
                if (_counter > 0)
                    Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: FloatingActionButton(
                        onPressed: _decrementCounter,
                        tooltip: 'Decrement',
                        child: const Icon(Icons.remove),
                    ),
                    ),

                Spacer(),

                Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                    ),
                ),
            ],
        ),
    ```