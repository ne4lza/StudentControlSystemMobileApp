import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:kolej_client/themes/app_color.dart';
import 'package:kolej_client/views/home.dart';
import 'package:kolej_client/views/last_activities.dart';
import 'package:kolej_client/views/login.dart';
import 'package:kolej_client/views/scan_qr_code.dart';

class SideBar extends StatelessWidget {
  final String userAccountName;
  final String userAccountEmail;
  final String userProfilePhoto;

  const SideBar({
    super.key,
    required this.userAccountName,
    required this.userAccountEmail,
    required this.userProfilePhoto
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).brightness == Brightness.light
                ? AppColor.bodyColor
                : AppColor.bodyColorDark,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                                ? Colors.white 
                                : Colors.black,
            ),
            accountName: Text(
              userAccountName,
              style: Theme.of(context).textTheme.bodyLarge
            ),
            accountEmail: Text(
              userAccountEmail,
              style: Theme.of(context).textTheme.bodyLarge
              
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(userProfilePhoto),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              ),
            title: Text(
              "Profilim",
              style: Theme.of(context).textTheme.bodyLarge
            ),
            onTap: ()=>Grock.toRemove(Home()),
          ),
          ListTile(
            leading: Icon(
              Icons.qr_code_2_rounded,
              ),
            title: Text(
              "Qr Kodu Okut",
              style: Theme.of(context).textTheme.bodyLarge
            ),
            onTap: ()=>Grock.toRemove(ScanQrCode()),
          ),
          ListTile(
            leading: Icon(
              Icons.move_up_rounded,
              ),
            title: Text(
              "Son İşlemlerim",
              style: Theme.of(context).textTheme.bodyLarge
            ),
            onTap: ()=> Grock.toRemove(LastActivities())
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              ),
            title: Text(
              "Çıkış Yap",
              style: Theme.of(context).textTheme.bodyLarge
            ),
            onTap: ()=>Grock.toRemove(Login()),
          ),
        ],
      ),
    );
  }
}