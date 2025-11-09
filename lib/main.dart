import 'package:flutter/material.dart';
import './routes.dart';
import 'package:esoger/ui/theme/index.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:esoger/provider/profile.dart';
import 'package:esoger/provider/product_design.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  await container.read(profileProvider.notifier).loadProfile();
  await container.read(productDesignProvider.notifier).loadProductDesign();

  runApp(
    ProviderScope(
      parent: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final GoRouter router;

  @override
  void initState() {
    super.initState();
    router = createRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Esoger',
      theme: appTheme,
    );
  }
}
