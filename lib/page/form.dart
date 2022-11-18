import 'package:counter_7/main.dart';
import 'package:counter_7/page/list.dart';
import 'package:counter_7/page/mywatchlist_page.dart';
import 'package:flutter/material.dart';

var list = [];

class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class Transaksi{
   String judul;
   int nominal;
   String jenis;

   Transaksi({required this.judul, required this.nominal, required this.jenis});
}

class _MyFormPageState extends State<MyFormPage> {
    final _formKey = GlobalKey<FormState>();

    String _judul = "";
    int _nominal = 0;

    

    String jenis = 'Pemasukan';
    List<String> listJenis = ['Pengeluaran', 'Pemasukan'];

    List doSomething(){
      return list;
    }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Form'),
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Counter_7"),
                    onTap: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MyHomePage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Tambah Budget"),
                    onTap: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MyFormPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Daftar Budget"),
                    onTap: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MyListPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('My Watchlist'),
                    onTap: () {
                        // Route menu ke halaman to do
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MywatchlistPage()),
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
                            hintText: "Contoh: Makan Masjep",
                            labelText: "Judul",
                            // Menambahkan icon agar lebih intuitif
                            icon: const Icon(Icons.title),
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        // Menambahkan behavior saat nama diketik 
                        onChanged: (String? value) {
                            setState(() {
                                _judul = value!;
                            });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                            setState(() {
                                _judul = value!;
                            });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Nama lengkap tidak boleh kosong!';
                            }
                            return null;
                            },
                        ),
                      ),

                      Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Contoh: 10000",
                            labelText: "Nominal",
                            // Menambahkan icon agar lebih intuitif
                            icon: const Icon(Icons.attach_money),
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        // Menambahkan behavior saat nama diketik 
                        onChanged: (String? value) {
                            setState(() {
                                _nominal = int.parse(value!);
                            });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                            setState(() {
                                _nominal = int.parse(value!);
                            });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Nominal tidak boleh kosong!';
                            }
                            return null;
                            },
                        ),
                      ),

                      ListTile(
                      leading: const Icon(Icons.type_specimen),
                      title: const Text(
                          'Pilih Jenis',
                      ),
                      trailing: DropdownButton(
                          value: jenis,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: listJenis.map((String items) {
                          return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                          );
                          }).toList(),
                          onChanged: (String? newValue) {
                          setState(() {
                              jenis = newValue!;
                          });
                          },
                      ),
                      ),

                      TextButton(
                        child: const Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
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
                                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        const Center(child: Text('Data Berikut Tersimpan Di Aplikasi')),
                                        const SizedBox(height: 20),
                                      
                                        Text(
                                            'Judul: $_judul\n' 
                                            'Noninal: $_nominal\n'
                                            'Jenis: $jenis',
                                            textAlign: TextAlign.center,
                                          ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            list.add( Transaksi( judul: _judul, nominal: _nominal, jenis: jenis));
                                            print(list);
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
                      ),

                      //INPUT MORE WIDGET HERE

                      ],
                      ),
                    ),
                ),
            ),
        );
    }
}