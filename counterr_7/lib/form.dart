import 'package:counterr_7/main.dart';
import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judulBudget = "";
  int budget = 0;
  String jenisBudget = 'Pilih Jenis';
  List<String> listJenisBudget = ['Pemasukan', 'Pengeluaran'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Budget'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Form Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        // Menggunakan padding sebesar 8 pixels
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Contoh: Makan",
                            labelText: "Judul",
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Menambahkan behavior saat nama diketik
                          onChanged: (String? value) {
                            setState(() {
                              _judulBudget = value!;
                            });
                          },
                          // Menambahkan behavior saat data disimpan
                          onSaved: (String? value) {
                            setState(() {
                              _judulBudget = value!;
                            });
                          },
                          // Validator sebagai validasi form
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Judul budget tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Padding(
                              // Menggunakan padding sebesar 8 pixels
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Contoh: 5000",
                                  labelText: "Nominal",
                                  // Menambahkan circular border agar lebih rapi
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                // Menambahkan behavior saat nama diketik
                                onChanged: (String? value) {
                                  setState(() {
                                    String budget = value!;
                                  });
                                },
                                // Menambahkan behavior saat data disimpan
                                onSaved: (String? value) {
                                  setState(() {
                                    String budget = value!;
                                  });
                                },
                                // Validator sebagai validasi form
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Nominal budget tidak boleh kosong!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        trailing: DropdownButton(
                          value: jenisBudget,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: listJenisBudget.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              jenisBudget = newValue!;
                            });
                          },
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: Container(
                                    child: ListView(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        const Center(
                                            child: Text(
                                          'Informasi Data',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                        const SizedBox(height: 20),
                                        Center(
                                          child: Column(children: [
                                            Text('Nama:  $_namaLengkap'),
                                            if (jenjangSarjana)
                                              const Text('Jenjang: Sarjana'),
                                            if (jenjangDiploma)
                                              const Text('Jenjang: Diploma'),
                                            if (jenjangMagister)
                                              const Text('Jenjang: Magister'),
                                            if (jenjangDoktor)
                                              const Text('Jenjang: Doktor'),
                                            Text('Umur:  $umur'),
                                            Text('Kelas:  $kelasPBP'),
                                            Text(
                                              _nilaiSwitch
                                                  ? 'Practice: Done'
                                                  : 'Practice: Not yet',
                                              style: TextStyle(
                                                  color: _nilaiSwitch
                                                      ? Colors.green
                                                      : Colors.red),
                                            )
                                          ]),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Kembali'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: const Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )))),
    );
  }
}
