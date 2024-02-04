import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:kolej_client/views/home.dart';
import 'package:kolej_client/views/qr_result.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isScanned = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'İşlem Yapmak için QR Kodu Okutunuz.',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.displayLarge
                  ),
                  const SizedBox(height: 10),
                 
                  const SizedBox(height: 50),
                  Expanded(
                    child: MobileScanner(
                      allowDuplicates: true,
                      controller:
                          MobileScannerController(facing: CameraFacing.back),
                      onDetect: (barcode, args) => {
                        if (!isScanned)
                          {isScanned = true, Grock.toRemove(ResultScreen())}
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
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
                          'Vazgeç',
                          style:
                             TextStyle(
                              color: Theme.of(context).brightness == Brightness.light
                                ? Colors.white 
                                : Colors.black, // buton metin rengi
                             )
                        ),
                      ),
                    ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Öğrenci Kontrol sistemleri | 2024',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.light
                                ? Colors.black 
                                : Colors.white,
                            fontSize: 14,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
