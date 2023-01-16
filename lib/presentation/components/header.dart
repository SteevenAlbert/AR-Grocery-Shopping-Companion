import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  Header({super.key, required this.size});

  final Size size;
  Future<String> sessionName() async {
    return await SessionManager().get("name");
  }
// Future<String> sessionImg() async {
//     return await SessionManager().get("pfp");
//   }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: sessionName(),
        builder: (BuildContext context, AsyncSnapshot<String> text) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning " + text.data!,
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
                          backgroundImage:
                              AssetImage("assets/images/profilepic.jpeg"),
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
