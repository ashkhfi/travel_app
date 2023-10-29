class Tempat {
  final String image;
  final String nama;
  final String deskripsi;
  final double rating;
  final String lokasi;
  bool liked; 

  Tempat({
    required this.image,
    required this.nama,
    required this.deskripsi,
    required this.rating,
    required this.lokasi,
    this.liked = false, 
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'nama': nama,
      'deskripsi': deskripsi,
      'rating': rating,
      'lokasi': lokasi,
      'liked' : liked
    };
  }
}
