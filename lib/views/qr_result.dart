import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:kolej_client/views/home.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.green,
              size: 150,
            ),
            const SizedBox(height: 30),
            Text(
              'QR Kod okuma işlemi başarılı.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Theme.of(context).brightness == Brightness.light
                                ? Colors.black 
                                : Colors.white, // buton metin rengi
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () => Grock.toRemove(Home()),
                      child: Center(
                        child: Text(
                          'Anasayfaya Dön',
                          style:
                             TextStyle(
                              color: Theme.of(context).brightness == Brightness.light
                                ? Colors.white 
                                : Colors.black, // buton metin rengi
                             )
                        ),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
