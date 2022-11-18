import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart' as form;
import 'package:counter_7/page/mywatchlist_page.dart';
import 'package:flutter/material.dart';
var itemTransaksi = form.list;

class MyListPage extends StatefulWidget {
    const MyListPage({super.key});

    @override
    State<MyListPage> createState() => _MyListPageState();
}


class _MyListPageState extends State<MyListPage> {
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
                      MaterialPageRoute(builder: (context) => const form.MyFormPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Daftar Budget"),
                    onTap: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const form.MyFormPage()),
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
            body: Column( 
                      children: [
                        for(var item in itemTransaksi)...[
                          Container(
                                child: Card(
                                elevation: 0,
                                color: Theme.of(context).colorScheme.surfaceVariant,
                                child:  SizedBox(
                                  width: 1000,
                                  height: 100,
                                  child: Center(
                                    child: RichText(text: TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(text: item.judul+"\n", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,)),
                                          TextSpan(text: item.nominal.toString()+"                                                                                                                                            "+item.jenis),
                                        ],
                                      ),),
                                ),
                              ),
                            ),
                          )],
                      ],
                  )
            );
    }
}