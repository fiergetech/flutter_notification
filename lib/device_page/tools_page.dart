import 'package:flutter/material.dart';
import 'package:flutter_notification/control_page/control_screen.dart';

class ToolsPage extends StatefulWidget {
  @override
  _ToolsPageState createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Material(
            elevation: 3,
            child: Container(
              margin: EdgeInsets.only(top: 40),
              /*decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),*/
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello!",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red[900],
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () => SwitchPage(),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              //widget yang akan ditampilkan dalam 1 baris adalah 2
              crossAxisCount: 2,
              children: [
                //card ditampilkan disini
                //saya membuat custom card di bawah agar kodingan tidak terlalu panjang
                CustomCard(
                    title: "Lampu Teras",
                    image:
                        "https://cdn.pixabay.com/photo/2018/02/01/14/09/yellow-3123271_960_720.jpg"),
                CustomCard(
                    title: "Judul Card Ketiga",
                    image:
                        "https://cdn.pixabay.com/photo/2016/08/27/14/38/mountains-1624284__340.jpg"),
                CustomCard(
                    title: "Judul Card Keempat",
                    image:
                        "https://cdn.pixabay.com/photo/2016/11/29/02/23/cliffs-1866832__340.jpg"),
                CustomCard(
                    title: "Judul Card Kelima",
                    image:
                        "https://cdn.pixabay.com/photo/2016/09/18/23/23/sugarloaf-mountain-1679285__340.jpg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//membuat customcard yang bisa kita panggil setiap kali dibutuhkan
class CustomCard extends StatelessWidget {
  //ini adalah konstruktor, saat class dipanggil parameter konstruktor wajib diisi
  //parameter ini akan mengisi title dan gambar pada setiap card
  CustomCard({this.title, this.image});

  String title;
  String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        //menambahkan bayangan
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        image,
                      ),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(title),
              ),
            )
          ],
        ),
      ),
    );
  }
}
