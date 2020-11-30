import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class SliderItems extends StatelessWidget {
  const SliderItems({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Today's Special",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
              ),
              Items(),
            ],
          ),
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        height: 166,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/beyond-meat-mcdonalds.png"),
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // gradient: LinearGradient(
            //   colors: [
            //     Color(0xFFFF961F).withOpacity(0.7),
            //     kPrimaryColor.withOpacity(0.7),
            //   ],
            // ),
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    child: ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Pizza'),
                      subtitle: Text('Chez Azziz, Paris'),
                    ),
                  ))),
        ),
      ),
    );
  }
}
