import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolej_client/components/side_bar.dart';
import 'package:kolej_client/controllers/dependency.dart';
import 'package:kolej_client/generated/locale_keys.g.dart';
import 'package:kolej_client/riverpod/riverpod_manager.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  void initState() {
    DependencyInjection.init();
    ref.read(homeRiverpod).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homeRiverpod);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: SideBar(
        userAccountName: state.userData.userName ?? "",
        userAccountEmail: state.userData.userSurName ?? "",
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: state.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            LocaleKeys.SideBar_ayarlar.tr(),
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ],
                      ),
                      const Divider(height: 20, thickness: 1),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(LocaleKeys.Settings_dil.tr()),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            context.setLocale(Locale("tr","TR"));
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "Türkçe",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Colors.black
                                                  : Colors
                                                      .white, // buton metin rengi
                                            ),
                                          )),
                                          TextButton(
                                          onPressed: () {
                                            context.setLocale(Locale("en","US"));
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "English",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Colors.black
                                                  : Colors
                                                      .white, // buton metin rengi
                                            ),
                                          ))
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                       child: Text(
                                        LocaleKeys.ScanQr_scan_qr_screen_button.tr()
                                       )
                                       ),
                                  ],
                                );
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                LocaleKeys.Settings_dil.tr(),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
    );
  }

  GestureDetector buildOptions(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
