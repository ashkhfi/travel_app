import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class HalamanDetail extends StatefulWidget {
  final Tempat tempat;

  HalamanDetail({required this.tempat});

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'gambar_${widget.tempat.image}',
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.tempat.image),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 100,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Container rating tetap di sisi kiri
                  children: [
                    Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white70,
                          width: 3,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.tempat.rating.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    widget.tempat.nama,
                    style: TextStyle(
                      height: 0.8,
                      fontSize: 70,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: AutoSizeText(
                    widget.tempat.deskripsi,
                    style: TextStyle(
                      fontFamily: 'Lora',
                      height: 1,
                      fontSize: 20,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w400,
                    ),
                    minFontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20, // Menambahkan jarak 5
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width - 50,
                      child: AutoSizeText(
                        widget.tempat.lokasi,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1,
                          fontSize: 30,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 25,
            left: 15,
            child: FloatingActionButton(
              heroTag: 'fab_2',
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.white70,
              elevation: 0,
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 25,
            right: 15,
            child: FloatingActionButton(
              heroTag: 'fab_1',
              onPressed: () {
                setState(() {
               widget.tempat.liked = !widget.tempat.liked;
                });
              },
              backgroundColor: Colors.white70,
              elevation: 0,
              child:
                  Icon(widget.tempat.liked ? Icons.favorite : Icons.favorite_border),
            ),
          ),
        ],
      ),
    );
  }
}
