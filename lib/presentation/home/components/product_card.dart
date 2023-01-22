import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:ar_grocery_companion/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/presentation/home/components/fav_icon_container.dart';
import 'package:ar_grocery_companion/presentation/home/components/stars.dart';

class ProductCard extends ConsumerWidget {
  final Product product;
  final Function? press;
  final int sectionID;
  const ProductCard({
    Key? key,
    required this.product,
    required this.sectionID,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: () => GoRouter.of(context).pushNamed("ProductPage",
            extra: product, params: {'fromAR': "false"}),
        child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black12,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFe5e5e5).withOpacity(0.4),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 50,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.05),
                            )
                          ]),
                      child: FutureBuilder(
                        future: FireStorage.getUrl(
                            "/images/products_pictures/${product.images[0]}"),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            return SimpleShadow(
                                child: (sectionID == 1)
                                    ? AspectRatio(
                                        aspectRatio: 16 / 10,
                                        child: snapshot.data!.isEmpty
                                            ? Image.asset(kNoProductImg)
                                            : Image.network(snapshot.data!))
                                    : Image.asset(snapshot.data!,
                                        width: 100, height: 100));
                          } else {
                            return SimpleShadow(
                                child: AspectRatio(
                                    aspectRatio: 16 / 10,
                                    child: Image.asset(kNoProductImg)));
                          }
                        }),
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 3),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    product.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    product.manufacturer.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ]),
                        ),
                        if (sectionID == 1) FavIconContainer(product: product)
                      ])),
                ],
              ),
            )));
  }
}
