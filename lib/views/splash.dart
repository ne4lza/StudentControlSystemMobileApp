import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kolej_client/controllers/dependency.dart';
import 'package:kolej_client/views/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    DependencyInjection.init();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_)=> Login())
      );
    });
    super.initState();
  }

  void dispose(){
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white10,Colors.grey],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
          ),
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              
              'ÖĞRENCİ KONTROL SİSTEMLERİ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 5
              ),
            ),
            const SizedBox(height: 20,),
            CircularProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.transparent
            )
          ],
        ),
      ),
    );
  }
}