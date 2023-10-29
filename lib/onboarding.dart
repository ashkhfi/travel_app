import 'package:flutter/material.dart';

import 'home.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/onboard.jpg',
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Agar tulisan berada di tengah vertikal
            children: [
               SizedBox(
                height: MediaQuery.sizeOf(context).height / 3
              ),
              Text(
                "Book Your",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Next Journey",
                style: TextStyle(
                    fontSize: 40,
                    height: 0.5,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
               Text(
                "Lets get started",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  child: const Text("Get started"))
            ],
          ),
        ),
      ),
    );
  }
}
