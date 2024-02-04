import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolej_client/components/home_card.dart';
import 'package:kolej_client/components/side_bar.dart';
import 'package:kolej_client/controllers/dependency.dart';
import 'package:kolej_client/models/last_activities_model.dart';
import 'package:kolej_client/riverpod/riverpod_manager.dart';
import 'package:kolej_client/services/service.dart';

class LastActivities extends ConsumerStatefulWidget {
  // ignore: non_constant_identifier_names
  final List<LastActivitiesModel> last_activities = [];

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LastActivitiesState();
}
Service service = Service();
class _LastActivitiesState extends ConsumerState<LastActivities> {
  @override
  void initState() {
    DependencyInjection.init();
    ref.read(homeRiverpod).getData();
    service.getLast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homeRiverpod);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Son Aktivitelerim',
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
            : FutureBuilder(
  future: service.getLast(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        )
        );
    } else if (snapshot.hasError) {
      return Text("Error: ${snapshot.error}");
    } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
      return Text("No data available");
    } else {
      List<LastActivitiesModel> lastActivities = snapshot.data as List<LastActivitiesModel>;

      return ListView.builder(
        itemCount: lastActivities.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              HomeCard(title: snapshot.data![index].title.toString(), subTitle: snapshot.data![index].category.toString(), icon: Icons.calendar_month_outlined),
              const SizedBox(height: 20)
            ],
          );
        },
      );
    }
  },
)




      ),
    );
  }
}