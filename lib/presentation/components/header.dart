import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  Header({super.key, required this.size});

  final Size size;
  Future<String> sessionName() async {
    return (await SessionManager().containsKey("isLoggedIn") != true ||
            await SessionManager().get("isLoggedIn") != true)
        ? ""
        : await SessionManager().get("name");
  }

  Future<String> sessionPfpPath() async {
    return (await SessionManager().containsKey("isLoggedIn") != true ||
            await SessionManager().get("isLoggedIn") != true)
        ? kNoPfpImg
        : await SessionManager().get("pfpPath");
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: Future.wait([sessionName(), sessionPfpPath()]),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning " + (snapshot.data![0]),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "Wanna check some products?",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () => GoRouter.of(context).push("/profile_page"),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(snapshot.data![1]),
                          radius: 25,
                        )),
                  ],
                )
              ],
            ),
          );
        });
  }
}
