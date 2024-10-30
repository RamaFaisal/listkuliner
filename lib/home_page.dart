import 'package:flutter/material.dart';
import 'package:listkuliner/list_item.dart';
import 'package:listkuliner/makanan.dart';
import 'package:listkuliner/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listMakanan.length, // Mengatur jumlah item sesuai panjang list
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Column(
          children: [
            if (index == 0) // Menampilkan header pada item pertama
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.list_alt_sharp, size: 30),
                  SizedBox(width: 10),
                  Text('List Kuliner', style: textHeader1),
                ],
              ),
            const SizedBox(height: 20),
            ListItem(
                makanan: listMakanan[index]), // List item untuk setiap makanan
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 178, 178, 178),
                    offset: Offset(1.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              height: 100,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 85,
                    height: 75,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Sub Title",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
