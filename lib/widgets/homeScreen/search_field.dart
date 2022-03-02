import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/change_theme_provider.dart';

class SearchFieldHomeScreen extends StatelessWidget {
  const SearchFieldHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.017),
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: context.watch<ChangeThemeProvider>().searchFieldColor,
          hintText: "Search anything here",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25.7),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7))),
    );
  }
}
