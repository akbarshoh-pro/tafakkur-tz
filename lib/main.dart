import 'package:card_settings/data/resource/local/hive_helper.dart';
import 'package:card_settings/presentation/manager/cards_list/cards_list_bloc.dart';
import 'package:card_settings/presentation/manager/cards_list/cards_list_event.dart';
import 'package:card_settings/presentation/pages/cards_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (context) => CardsListBloc()
          ..add(GetAllCards()),
          child: const CardsListScreen()
      ),
    );
  }
}

