import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_database/cubit/note_cubit.dart';
import 'package:hive_database/notemode.dart';
import 'package:hive_database/pages.dart/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

const String noteBoxName = "notes";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //path provider
  var directory = await getApplicationDocumentsDirectory();
  //adding path to hive
  Hive.init(directory.path);
  //inital hive for flutter
  await Hive.initFlutter();
  //opening hiveBox
  await Hive.openBox(noteBoxName);
  //register adapter
  Hive.registerAdapter(NoteModelAdapter());

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = GoogleFonts.robotoTextTheme();
    return BlocProvider(
      create: (context) => NoteCubit()..getBox(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        home: HomePage(),
      ),
    );
  }
}
