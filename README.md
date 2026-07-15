# Kalkulator Interaktif Assembly (x86-64 Linux)

Kalkulator sederhana berbasis Assembly (NASM x86-64) untuk lingkungan Linux. Program ini dirancang untuk meminta input dua buah angka (masing-masing 1 digit) dan satu operator aritmatika (+, -, atau *), lalu menampilkan hasilnya ke layar.
Catatan: Untuk menjaga agar struktur kode tetap sederhana, program ini hanya menerima input satu digit (0-9) untuk setiap angka.
Cara Menjalankan
Gunakan perintah berikut di terminal Linux untuk melakukan kompilasi dan menjalankan program:

```text
nasm -f elf64 kalkulator.asm
ld kalkulator.o -o kalkulator
./kalkulator
```

Contoh Penggunaan

```text
Masukkan angka pertama (0-9): 7
Masukkan operator (+,-,*): *
Masukkan angka kedua (0-9): 6
Hasil: B
```

Kenapa hasilnya huruf "B"?
Program ini dibuat sangat minimalis dan tidak menyertakan fungsi konversi angka ke teks (integer to string).
Ketika melakukan operasi matematika (misalnya 7 × 6 = 42), program langsung menambahkan hasil tersebut dengan nilai dasar karakter '0' (desimal 48) agar bisa dicetak sebagai karakter ASCII tunggal. Karena 42 + 48 menghasilkan nilai desimal tertentu di tabel ASCII (dalam hal ini karakter huruf), yang muncul di layar adalah representasi karakternya, bukan angka "42".
Pengembangan Lebih Lanjut (Multi-digit)
Jika ingin membuat kalkulator yang bisa menghasilkan output normal seperti ini:

```text
Masukkan angka pertama: 123
Masukkan operator: *
Masukkan angka kedua: 45
Hasil: 5535
```

Kita perlu menulis fungsi konversi string-ke-integer (untuk membaca input) dan integer-ke-string (untuk mencetak output) secara manual.
Di bahasa Assembly tingkat rendah, tidak ada fungsi instan seperti printf atau cout. Proses konversi manual ini biasanya membuat baris kode membengkak hingga 200–300 baris karena harus menangani pembagian berulang untuk memecah angka, penanganan angka negatif, dan manajemen buffer memori.
