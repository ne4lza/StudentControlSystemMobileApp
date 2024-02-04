import 'package:flutter/material.dart';
class HomeCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;

  const HomeCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon
  });
  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey[300]
                      : Colors.grey[900],
                borderRadius: BorderRadius.circular(10)
              ),
              child: ListTile(
                title: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge
                  ),
                subtitle: Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodyLarge
                  ),
                leading: Icon(
                  icon,
                  
                  ),
              ),
            );
  }
}