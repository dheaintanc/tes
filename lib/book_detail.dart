import 'package:flutter/material.dart';
import 'package:kuismobile/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetail extends StatelessWidget {
  final DataBuku infobuku;
  const BookDetail({super.key, required this.infobuku});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Data Buku'),
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {
                  //     });
                  //     SnackBar snackBar = SnackBar(content: Text(text));
                  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: Icon(Icons.favorite_border),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            SizedBox(height: 30),

            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 3,
              child: Image.network(widget.infobuku.imgUrls),
            ),
            Text(
              widget.infobuku.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(),
            // ),
            Container(
              child: DataTable(
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Judul buku')),
                    DataCell(Text(widget.infobuku.title)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Nama pengarang')),
                    DataCell(Text(widget.infobuku.author)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Tahun terbit')),
                    DataCell(Text(widget.infobuku.year[4])),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Negara')),
                    DataCell(Text(widget.infobuku.country)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Bahasa')),
                    DataCell(Text(widget.infobuku.language)),
                  ]),
                ],
              ),
            ),
            SizedBox(height: 100),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     diseases.symptom,
            //     textAlign: TextAlign.justify,
            //     style: TextStyle(
            //       fontSize: 18,
            //     ),
            //   ),
            // ),
            // Text(diseases.nutshell[0]),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _launchUrl(widget.infobuku.imgUrls);
          },
          child: Icon(Icons.view_array),
        ));
  }
}

Future<void> _launchUrl(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw Exception('Gagal membuka link : ${_url}');
  }
}
