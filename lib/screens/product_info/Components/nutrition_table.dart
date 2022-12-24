import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/models/metanutrients.dart';

Widget nutrientWidget({nutrientData, int? calories, String? servingSize}) {
  return Container(
    constraints: BoxConstraints(maxWidth: 800),
    padding: EdgeInsets.all(1.0),
    decoration:
        BoxDecoration(border: new Border.all(color: Colors.black, width: 2.0)),
    child: Container(
      padding: EdgeInsets.all(2.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          nutriHeader(
              calories: calories, servings: 1, servingSize: servingSize),
          nutrientValues(nutrientData: nutrientData),
          // vitaminValues(nutrientData: nutrientData),
          footerCalories(),
        ],
      ),
    ),
  );
}

Widget nutrientValues({nutrientData}) {
  //final n = (1.3456).toStringAsFixed(2);
  //final s = double.parse("1.2345");
  final nutrientTypes = MetaDataNutrient.macroNutrientTypes;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: nutrientTypes
        .map((d) => nutrientLiner(
              nutrientName: d["name"],
              qty: nutrientData["${d["nutrient"]}"]["amount"],
              ptg: d["dly"]["male"] != null
                  ? ((nutrientData["${d["nutrient"]}"]["amount"] * 100) /
                          d["dly"]["male"])
                      .toStringAsFixed(2)
                  : "-",
              sub: d["sub"],
              unit: nutrientData["${d["nutrient"]}"]["unit"],
              showp: d["dly"]["male"] != null ? true : false,
            ))
        .toList(),
  );
}

Widget nutriHeader({calories, servingSize, servings}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Nutrition Facts",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Poppins", fontSize: 24, fontWeight: FontWeight.bold),
      ),
      Text(
        "Serving Size $servingSize",
        style: TextStyle(
            fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w400),
      ),
      Text(
        "Servings Per Container $servings",
        style: TextStyle(
            fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w400),
      ),
      Container(
        margin: EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
        height: 5.0,
        color: Colors.black,
      ),
      Text(
        "Ammount Per Serving",
        style: TextStyle(
            fontSize: 10.0, color: Colors.black, fontWeight: FontWeight.w800),
      ),
      Container(
        margin: EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
        height: 1.0,
        color: Colors.black,
      ),
      Row(children: <Widget>[
        Text(
          "Calories",
          style: TextStyle(
              fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.w900),
        ),
        Text(
          " $calories",
          style: TextStyle(
              fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ]),
      Container(
          margin: EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
          height: 3.0,
          color: Colors.black),
      Container(
        alignment: Alignment.topRight,
        child: Text(
          "% Daily Value*",
          textAlign: TextAlign.right,
          style: TextStyle(
              fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      )
    ],
  );
}

Widget nutrientLiner({
  @required nutrientName,
  @required qty,
  ptg,
  sub: false,
  unit: "g",
  showp: true,
}) {
  final textSize = 15.0;
  final textWeight1 = FontWeight.w900;
  final textWeight2 = FontWeight.w500;
  return Container(
      padding: (sub)
          ? EdgeInsetsDirectional.only(start: 26.0, end: 1.0)
          : EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
      child: Column(children: <Widget>[
        Container(
            margin: EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
            height: 1.0,
            color: Colors.black),
        Row(
          children: <Widget>[
            Text(
              nutrientName,
              style: TextStyle(
                  fontSize: textSize,
                  color: Colors.black,
                  fontWeight: (sub) ? textWeight2 : textWeight1),
            ),
            Text(
              "  ${qty}${unit}",
              style: TextStyle(
                  fontSize: textSize,
                  color: Colors.black,
                  fontWeight: textWeight2),
            ),
            Expanded(
                child: Text(
              (((ptg == null) || !showp) ? "" : "${ptg}%"),
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: textSize,
                color: Colors.black,
                fontWeight: textWeight1,
              ),
            )),
          ],
        )
      ]));
}

Widget vitaminLiner({
  @required nutrientName,
  @required qty,
  ptg,
  showQty: false,
  unit: "g",
  showp: true,
}) {
  final textSize = 15.0;
  final textWeight = FontWeight.w500;
  return Container(
      padding: EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
      child: Column(children: <Widget>[
        Container(
            margin: EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
            height: 1.0,
            color: Colors.black),
        Row(
          children: <Widget>[
            Text(
              nutrientName,
              style: TextStyle(
                  fontSize: textSize,
                  color: Colors.black,
                  fontWeight: textWeight),
            ),
            Text(
              (showQty) ? "  ${qty}${unit}" : "",
              style: TextStyle(
                  fontSize: textSize,
                  color: Colors.black,
                  fontWeight: textWeight),
            ),
            Expanded(
                child: Text(
              (((ptg == null) || !showp) ? "" : "${ptg}%"),
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: textSize,
                color: Colors.black,
                fontWeight: textWeight,
              ),
            )),
          ],
        )
      ]));
}

Widget footerCalories({caloriesNum: 2000}) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
          height: 5.0,
          color: Colors.black,
        ),
        Text(
          "*Percent Daily Values are based on a ${caloriesNum} calories diet.",
          style: TextStyle(
              fontSize: 10.0, color: Colors.black, fontWeight: FontWeight.w400),
        )
      ]);
}
