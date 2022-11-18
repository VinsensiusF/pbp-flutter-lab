import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/list.dart';
import 'package:counter_7/page/watchlistDetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';

class MywatchlistPage extends StatefulWidget {
  const MywatchlistPage({ Key? key }) : super(key: key);

  @override
  _MywatchlistPageState createState() => _MywatchlistPageState();
}

class _MywatchlistPageState extends State<MywatchlistPage> {
Future<List<Watchlist>> fetchMyWatchList() async {
        var url = Uri.parse('https://tugas2-pbp-vinsen.herokuapp.com/mywatchlist/json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object ToDo
        List<Watchlist> listMyWatchList = [];
        for (var d in data) {
        if (d != null) {
            listMyWatchList.add(Watchlist.fromJson(d));
        }
        }

        return listMyWatchList;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('MyWatchList'),
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
                    MaterialPageRoute(builder: (context) => const MyApp()),
                    );
                },
                ),
                ListTile(
                title: const Text('Form'),
                onTap: () {
                    // Route menu ke halaman form
                    Navigator.pushReplacement(
                    context,
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
        body: FutureBuilder(
            future: fetchMyWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
                } else {
                if (!snapshot.hasData) {
                    return Column(
                    children: const [
                        Text(
                        "Tidak ada WatchList",
                        style: TextStyle(
                            color: Color(0xff59A5D8),
                            fontSize: 20),
                        ),
                        SizedBox(height: 8),
                    ],
                    );
                } else {
                    return Scaffold(
                      body: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index)=> Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0
                            )
                          ]
                        ),
                        child: InkWell(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(
                                "${snapshot.data![index].fields.title}",
                                style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                ),
                            ),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.watched}"),
                            ],
                        ),
                        onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WatchlistDetail(watchlist: snapshot.data![index],)));
                        },
                        )
                        
                    )
                  )
                    );
                    
                }
                }
            }
        )
    );
  }
}