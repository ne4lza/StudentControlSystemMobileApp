import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolej_client/components/home_card.dart';
import 'package:kolej_client/components/side_bar.dart';
import 'package:kolej_client/controllers/dependency.dart';
import 'package:kolej_client/generated/locale_keys.g.dart';
import 'package:kolej_client/riverpod/riverpod_manager.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
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
            : SingleChildScrollView(
                child: Column
                (children: [
                  Text(
                    LocaleKeys.Home_page_title.tr(),
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  
                  Center(
                      child: Column(
                    children: [
                      const SizedBox(height: 10),
                    ],
                  )),
                  
                  const Divider(),
                  const SizedBox(height: 20,),
                  HomeCard(
                      title: 'Ad - Soyad',
                      subTitle: state.userData.userName! +" "+state.userData.userSurName! ,
                      icon: Icons.person),
                  const SizedBox(height: 20),
                  HomeCard(
                      title: 'Id',
                      subTitle: state.userData.id.toString(),
                      icon: Icons.workspace_premium_sharp),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeCard(
                      title: 'Ad',
                      subTitle: state.userData.insertedDate ?? "",
                      icon: Icons.email),
                  const SizedBox(height: 20),
                  HomeCard(
                      title: 'Ad',
                      subTitle: state.userData.id.toString(),
                      icon: Icons.person),
                  const SizedBox(height: 20),
                  HomeCard(
                      title: 'Ad',
                      subTitle: "state.userData.password!",
                      icon: Icons.man),
                ]),
              ),
      ),
    );
  }
}
