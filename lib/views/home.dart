import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolej_client/components/home_card.dart';
import 'package:kolej_client/components/side_bar.dart';
import 'package:kolej_client/controllers/dependency.dart';
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
          title: Text(
            'Profilim',
            style: Theme.of(context).textTheme.bodyLarge,
            ),
      ),
      drawer: SideBar(
        userAccountName: state.userData.userName ?? "",
        userAccountEmail: state.userData.userSurName ?? "",
        userProfilePhoto: "",
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
              child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),  
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(""),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.userData.userName! +" "+state.userData.userSurName! ,
                         style: Theme.of(context).textTheme.bodyLarge,
                        )
                        ],
                      )
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    HomeCard(title: 'Id', subTitle: state.userData.id.toString(), icon: Icons.workspace_premium_sharp),
                    const SizedBox(height: 20,),
                    HomeCard(title: 'Ad', subTitle: state.userData.insertedDate ?? "", icon: Icons.email),
                    const SizedBox(height: 20),
                    HomeCard(title: 'Ad', subTitle: state.userData.id.toString(), icon: Icons.person),
                    const SizedBox(height: 20),
                    HomeCard(title: 'Ad', subTitle: state.userData.password!, icon: Icons.man),
                  ]
                ),
            ),
      ),
    );
  }
}
