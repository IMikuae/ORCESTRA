# Checklist Testing

Checklist menulis test untuk skill `testing`. Jalankan berurutan;
strategi ditulis dulu sebelum satu baris test pun dibuat.

## 1. Strategi

| Cek | Yang harus benar |
|---|---|
| Perilaku | Jelas perilaku apa yang diuji, bukan "test fungsi X" tanpa perilaku |
| Level | Level dipilih sesuai kebutuhan: unit (logika), integrasi (antar modul), e2e (alur user) |
| Kasus tepi | Kasus kosong, batas, dan gagal ikut diuji, bukan hanya kasus bahagia |

## 2. Penulisan

| Cek | Yang harus benar |
|---|---|
| Struktur | Susun–jalankan–periksa (Arrange–Act–Assert) terbaca jelas |
| Satu perilaku | Satu test satu perilaku; tidak menumpuk banyak assert tak terkait |
| Fixture | Data uji lewat fixture/pabrik proyek; tidak ada data ajaib bertebaran |

## 3. Keandalan

| Cek | Yang harus benar |
|---|---|
| Red-green | Test gagal tanpa perbaikan dan hijau dengan perbaikan (bila menguji bug) |
| Tidak rapuh | Tanpa tidur sembarangan, tanpa state bersama, tanpa urutan yang wajib |
| Cepat | Test unit cepat; test lambat dipisah ke grupnya sendiri |

## Bukti serah terima

- File test yang dibuat/diubah (path saja).
- Hasil jalan test (perintah + hasil).
- Cakupan yang bertambah (bila proyek mengukurnya).
- Bila satu test gagal dua kali dengan sebab yang sama, berhenti dan
  laporkan — jangan mengulang pendekatan yang sama.
