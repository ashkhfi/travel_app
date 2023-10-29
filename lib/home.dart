import 'package:flutter/material.dart';
import 'data.dart';
import 'halaman_detail.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(), // Menambahkan physics untuk efek bouncing
        slivers: <Widget>[
            SliverAppBar(
            automaticallyImplyLeading: false,
            floating: false, // Set false agar app bar tidak mengambang
            pinned: true, // Set true agar app bar tetap terpasang di atas
            expandedHeight: 200, // Tinggi app bar yang diperluas
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              
              title: const Text(
                "Discover",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              background: Container(
                padding: const EdgeInsets.all(1),
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Find a place for yourself",
                    style: TextStyle(
                      fontSize: 25,
                          fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final tempat = dataTempat[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HalamanDetail(tempat: tempat),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Hero(
                          tag: 'gambar_${tempat.image}',
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            height: MediaQuery.of(context).size.height / 3 - 20,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(tempat.image),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width - 100,
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        tempat.nama,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white.withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: dataTempat.length,
            ),
          ),
        ],
      ),
    );
  }
}
