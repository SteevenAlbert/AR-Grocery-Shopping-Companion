import 'package:ar_grocery_companion/presentation/admin/home/components/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class WideAdminModule extends StatelessWidget {
  WideAdminModule({super.key});

  final PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            collapseWidth: 800,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Theme.of(context).primaryColorLight,
              selectedColor: Theme.of(context).primaryColor,
              selectedTitleTextStyle: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Theme.of(context).canvasColor),
              unselectedTitleTextStyle: Theme.of(context).textTheme.labelLarge,
              selectedIconColor: Theme.of(context).canvasColor,
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '2022',
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Dashboard',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: const Icon(Icons.dashboard),
                badgeContent: const Text(
                  '3',
                ),
                tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                priority: 1,
                title: 'Users',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: const Icon(Icons.supervisor_account),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Products',
                onTap: () {
                  page.jumpToPage(2);
                },
                icon: const Icon(Icons.bakery_dining),
                trailing: Container(
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 3),
                      child: Text(
                        'New',
                        style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                      ),
                    )),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Categories',
                onTap: () {
                  page.jumpToPage(3);
                },
                icon: const Icon(Icons.discount),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Manufacturers',
                onTap: () {
                  page.jumpToPage(4);
                },
                icon: const Icon(Icons.apartment),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                Dashboard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
