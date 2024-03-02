import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:kolej_client/generated/locale_keys.g.dart';
import 'package:kolej_client/themes/app_color.dart';
import 'package:kolej_client/views/home.dart';
import 'package:kolej_client/views/last_activities.dart';
import 'package:kolej_client/views/login.dart';
import 'package:kolej_client/views/scan_qr_code.dart';
import 'package:kolej_client/views/settings.dart';

class SideBar extends StatelessWidget {
  final String userAccountName;
  final String userAccountEmail;

  const SideBar({
    super.key,
    required this.userAccountName,
    required this.userAccountEmail,
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
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              ),
            title: Text(
              LocaleKeys.SideBar_profilim.tr(),
              style: Theme.of(context).textTheme.bodyLarge
            ),
            onTap: ()=>Grock.toRemove(Home()),
          ),
          ListTile(
            leading: Icon(
              Icons.qr_code_2_rounded,
              ),
            title: Text(
              LocaleKeys.SideBar_qr_kodu_okut.tr(),
              style: Theme.of(context).textTheme.bodyLarge
            ),
            onTap: ()=>Grock.toRemove(ScanQrCode()),
          ),
          ListTile(
            leading: Icon(
              Icons.move_up_rounded,
              ),
            title: Text(
              LocaleKeys.SideBar_son_islemlerim.tr(),
              style: Theme.of(context).textTheme.bodyLarge
            ),
            onTap: ()=> Grock.toRemove(LastActivities())
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              ),
            title: Text(
              LocaleKeys.SideBar_ayarlar.tr(),
              style: Theme.of(context).textTheme.bodyLarge
            ),
            onTap: ()=> Grock.toRemove(SettingsPage())
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              ),
            title: Text(
              LocaleKeys.SideBar_cikis_yap.tr(),
              style: Theme.of(context).textTheme.bodyLarge
            ),
            onTap: ()=>Grock.toRemove(Login()),
          ),
        ],
      ),
    );
  }
}