import 'package:flutter/material.dart';
import 'package:listkuliner/styles.dart';

class DetailPage extends StatelessWidget {
  final String gambar;
  final String nama;
  final String waktubuka;
  final String kalori;
  final String harga;
  final String detail;
  final List<String> gambarlain;
  final List<Map<String, String>> bahan;

  const DetailPage({
    super.key,
    required this.gambar,
    required this.nama,
    required this.waktubuka,
    required this.kalori,
    required this.harga,
    required this.detail,
    required this.gambarlain,
    required this.bahan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBgColor,
      body: Stack(
        children: <Widget>[
          // Gambar background
          Image.asset(
            gambar,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavouriteButton(), // Pastikan Anda sudah mendefinisikan widget ini
                      ],
                    ),
                  ),
                  const SizedBox(height: 300), // Jarak untuk gambar
                  Center(
                    child: Text(
                      nama,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            const Icon(Icons.access_time_filled,
                                color: Color.fromARGB(255, 255, 230, 0)),
                            const SizedBox(height: 8),
                            Text(waktubuka),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.local_fire_department,
                                color: Colors.red),
                            const SizedBox(height: 8),
                            Text(kalori),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.monetization_on,
                                color: Colors.green),
                            const SizedBox(height: 8),
                            Text(harga),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      detail,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: gambarlain.map((url) {
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(url),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Bahan Racikan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          children: [
                            Image.asset(bahan[index].values.first, width: 52),
                            Text(bahan[index].keys.first),
                          ],
                        ),
                      ),
                      separatorBuilder: (_, index) => const SizedBox(width: 15),
                      itemCount: bahan.length,
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({super.key});

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
        size: 40,
      ),
      onPressed: () {
        setState(() {
          isFavourite = !isFavourite;
        });
      },
    );
  }
}
