import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Katalog Elektronik',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade300),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'IPhone - Apple (ID)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> ListProduk = [
    {
      'gambar': 'iphone16pro.png',
      'judul': 'iPhone 16 Pro',
      'rating': '4.8',
      'ulasan': '25 rb'
    },
    {
      'gambar': 'iphone16.png',
      'judul': 'iPhone 16',
      'rating': '4.5',
      'ulasan': '18 rb'
    },
    {
      'gambar': 'iphone15.png',
      'judul': 'iPhone 15',
      'rating': '4.7',
      'ulasan': '10 rb'
    },
    {
      'gambar': 'iphone14.png',
      'judul': 'iPhone 14',
      'rating': '4.6',
      'ulasan': '22 rb'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
        title: Text(
          'Katalog Produk Elektronik',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.60,
          ),
          itemCount: ListProduk.length,
          itemBuilder: (context, index) {
            final produk = ListProduk[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/${produk['gambar']}',
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      produk['judul'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: double.parse(produk['rating']),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          ignoreGestures: true,
                          itemCount: 5,
                          itemSize: 16,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.yellow.shade600,
                          ),
                          onRatingUpdate: (value) {},
                        ),
                        SizedBox(width: 5),
                        Text(
                          produk['rating'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${produk['ulasan']} ulasan',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Spacer(), // Mengisi ruang kosong secara fleksibel
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                        label: Text('Beli'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade300,
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
