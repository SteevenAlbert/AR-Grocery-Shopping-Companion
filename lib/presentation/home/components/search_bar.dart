import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              prefixIcon: Icon(Icons.search),
              hintText: "Search Products",
              filled: true,
              fillColor: Theme.of(context).primaryColor,
              suffixIcon:  Icon(Icons.qr_code_scanner),
            ),
          ),
        ),
      ],
    );
  }
}