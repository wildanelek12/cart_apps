import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cart_apps/src/model/data.dart';
import 'package:cart_apps/src/themes/light_color.dart';
import 'package:cart_apps/src/themes/theme.dart';
import 'package:cart_apps/src/widgets/product_card.dart';
import 'package:cart_apps/src/widgets/product_icon.dart';
import 'package:cart_apps/src/widgets/extentions.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(

      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Theme.of(context).backgroundColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }



  Widget _productWidget() {
    return Container(
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullHeight(context),
      child: GridView.count(
        primary: false,
        mainAxisSpacing: 10,
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: 2/3 ,
        children: AppData.productList
            .map(
              (product) => ProductCard(
                product: product,
                onSelected: (model) {
                  setState(() {
                    AppData.productList.forEach((item) {
                      item.isSelected = false;
                    });
                    model.isSelected = true;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height+200,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
    
            _productWidget(),
          ],
        ),
      ),
    );
  }
}
