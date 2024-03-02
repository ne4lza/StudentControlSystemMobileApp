import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:kolej_client/generated/locale_keys.g.dart';
import 'package:kolej_client/services/qr_service.dart';
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
    QrService qrService = QrService();
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
                  Text(LocaleKeys.ScanQr_scan_qr_screen_title.tr(),
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(height: 10),
                  const SizedBox(height: 50),
                  Expanded(
                    child: MobileScanner(
                      allowDuplicates: true,
                      controller:
                          MobileScannerController(facing: CameraFacing.back),
                      onDetect: (barcode, args) {
                        String qrCodeValue = barcode.rawValue.toString();
                        print("Okunan QR Kodu: $qrCodeValue");
                        // QR kodu değerini kullanmak için burada gerekli işlemleri yapabilirsiniz
                        if (!isScanned) {
                          isScanned = true;
                          final String userName = GetStorage().read("userName");
                          qrService.sendQrData(userName, qrCodeValue);
                          Grock.toRemove(ResultScreen());
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 82, 63, 63),
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : Colors.white, // buton metin rengi
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () => Grock.toRemove(Home()),
                    child: Center(
                      child: Text(LocaleKeys.ScanQr_scan_qr_screen_button.tr(),
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.black, // buton metin rengi
                          )),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        LocaleKeys.Login_Baslik.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
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
