import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolej_client/riverpod/home_riverpod.dart';
import 'package:kolej_client/riverpod/login_riverpod.dart';

final loginRiverpod = ChangeNotifierProvider((_) => LoginRiverpod());
final homeRiverpod = ChangeNotifierProvider((_) => HomeRiverpod());