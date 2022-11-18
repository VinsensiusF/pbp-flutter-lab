import 'package:counter_7/main.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/list.dart';
import 'package:counter_7/page/mywatchlist_page.dart';
import 'package:flutter/material.dart';

class WatchlistDetail extends StatelessWidget {
  final Watchlist watchlist;

  const WatchlistDetail({Key? key, required this.watchlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
                title: const Text('WatchList Details'),
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
            body: Center(child: Container(
              height: 800.0,
              width: 800.0,
              color: Colors.blue[50],
              child: RichText(
                text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: "                          ${watchlist.fields.title}\n\n\n", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0,)),
                            const TextSpan(text: "                                Release Date: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(text: "${watchlist.fields.releaseDate}\n\n", style:TextStyle(fontSize: 20)),
                            const TextSpan(text: "                                Rating: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(text: "${watchlist.fields.rating}\n\n", style:const TextStyle(fontSize: 20)),
                            const TextSpan(text: "                                Watched: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(text: "${watchlist.fields.watched.toString().split('.').last}\n\n", style:const TextStyle(fontSize: 20)),
                            const TextSpan(text: "                                Review: \n"+"                                ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(text: watchlist.fields.review, style:const TextStyle(fontSize: 20)),
                          ]
                        ),
                        ),   
            ),)
          //   body: Column(
          //     children: [
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       Text(watchlist.fields.title, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          //       Text("Release Date: ${watchlist.fields.releaseDate}", style: const TextStyle(fontSize: 20)),
          //       Text("Rating: ${watchlist.fields.rating}", style: const TextStyle(fontSize: 20)),
          //       Text("Status: ${watchlist.fields.watched}", style: const TextStyle(fontSize: 20)),
          //       Text("Review: \n${watchlist.fields.review}", style: const TextStyle(fontSize: 20)),
          //     ],
          // ),
    );
  }
}
