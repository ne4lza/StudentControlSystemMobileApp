import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolej_client/components/login_text_field.dart';
import 'package:kolej_client/controllers/dependency.dart';
import 'package:kolej_client/riverpod/riverpod_manager.dart';

class Login extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  void initState() {
    DependencyInjection.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(left: 20, right: 20, top: 150, bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // ignore: deprecated_member_use
            Text(
              "Öğrenci \nKontrol Sistemleri",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: LoginTextField(
                      controller: ref.read(loginRiverpod).usernameController,
                      hint: 'Kullanıcı Adınız',
                      obscure: false),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: LoginTextField(
                      controller: ref.read(loginRiverpod).passwordController,
                      hint: 'Şifreniz',
                      obscure: true),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Theme.of(context).brightness == Brightness.light
                                ? Colors.black 
                                : Colors.white, // buton metin rengi
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () => ref.read(loginRiverpod).fetch(),
                      child: Center(
                        child: Text(
                          'Giriş Yap',
                          style:
                             TextStyle(
                              color: Theme.of(context).brightness == Brightness.light
                                ? Colors.white 
                                : Colors.black, // buton metin rengi
                             )
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // ignore: deprecated_member_use
                    Text(
                      '2024',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
