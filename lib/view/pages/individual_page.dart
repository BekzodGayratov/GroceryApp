import 'package:flutter/material.dart';
import 'package:project/providers/change_theme_provider.dart';
import 'package:provider/provider.dart';

class IndivudialPage extends StatelessWidget {
  const IndivudialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangeThemeProvider(),
      builder: (context, child) {
        return Scaffold(
            appBar: AppBar(
          backgroundColor: context.watch<ChangeThemeProvider>().scaffoldColor,
          elevation: 0,
          actions: [IconButton(icon: Text(""),onPressed: (){},)],
        ));
      },
    );
  }
}
