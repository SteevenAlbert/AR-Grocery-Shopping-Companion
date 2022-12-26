import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchBar extends StatelessWidget {
  final Size size;
  const SearchBar({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'search',
        child: GestureDetector(
          onTap: () => GoRouter.of(context).push("/search_page"),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(15),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text("Search Products",
                        style:
                            TextStyle(fontSize: 16, color: Colors.grey[600])),
                  ),
                  SizedBox(width: size.width / 3.5),
                  Icon(
                    Icons.qr_code_scanner,
                    color: Colors.grey[600],
                  ),
                  SizedBox(width: 9),
                  Container(
                      height: 60,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).primaryColor),
                      child: Icon(color: Colors.white, Icons.search)),
                ],
              ),
            ),
          ),
        ));
  }
}
