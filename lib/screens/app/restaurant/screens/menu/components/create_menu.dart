import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/components/models/item_lists_models.dart';
import 'package:food_app/screens/app/restaurant/local/models/item_model.dart';
import 'package:food_app/screens/app/restaurant/local/service/menu_api_service.dart';

import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class CreateMenuItem extends StatefulWidget {
  MenuItemsListMd itemList;
  CreateMenuItem({Key key, this.itemList}) : super(key: key);

  @override
  _CreateMenuItemState createState() => _CreateMenuItemState();
}

class _CreateMenuItemState extends State<CreateMenuItem> {
  bool _isLoading = false;
  MenuApiService _apiService = MenuApiService();
  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();
  TextEditingController _controllerCategorie = TextEditingController();

  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  void initState() {
    if (widget.itemList != null) {
      _controllerTitle.text = widget.itemList.title;
      _controllerDescription.text = widget.itemList.description;
      _controllerPrice.text = widget.itemList.price;
      _controllerCategorie.text = widget.itemList.categories;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                // ignore: deprecated_member_use
                .title
                .copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: widget.itemList == null ? "New Menu" : "Update Menu",
                style: TextStyle(color: kTextColor),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          widget.itemList != null
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Warning"),
                          content: Text(
                              "Are you sure want to delete Menu ${widget.itemList.title}?"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Yes"),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                _apiService
                                    .deleteMenu(widget.itemList.id)
                                    .then((isSuccess) {
                                  if (isSuccess) {
                                  } else {}
                                });
                              },
                            ),
                            FlatButton(
                              child: Text("No"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                )
              : Container(),
        ],
      ),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 180,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: _image == null
                                ? AssetImage('assets/images/emma.jpg')
                                : FileImage(_image),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black,
                            Colors.black.withOpacity(.3)
                          ])),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: getImage,
                              child: Container(
                                width: 60,
                                height: 40,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Camera(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(15),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 11),
                                  Container(
                                    padding: EdgeInsets.only(left: 12),
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(244, 243, 243, 1),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: TextField(
                                      controller: _controllerTitle,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Title",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(244, 243, 243, 1),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: TextField(
                                      controller: _controllerDescription,
                                      minLines: 3,
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                        filled: true,
                                        border: InputBorder.none,
                                        hintText: "Description",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Price ( $priceSuffix )",
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 7),
                                        Container(
                                          padding: EdgeInsets.only(left: 12),
                                          margin: EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  244, 243, 243, 1),
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: TextField(
                                            controller: _controllerPrice,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "00.00",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    padding: EdgeInsets.only(left: 12),
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(244, 243, 243, 1),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: TextField(
                                      controller: _controllerCategorie,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Categories",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    // padding: EdgeInsets.all(20),
                                    width: double.infinity,
                                    // it will cover 80% of total width
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          if (_controllerTitle.text == null ||
                                              _controllerPrice.text == null ||
                                              _controllerDescription.text ==
                                                  null ||
                                              _controllerCategorie.text ==
                                                  null) {
                                            Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Please fill all fields'),
                                                backgroundColor: kPrimaryColor,
                                              ),
                                            );
                                          } else {
                                            setState(() => _isLoading = true);
                                            String title = _controllerTitle.text
                                                .toString();
                                            String description =
                                                _controllerDescription.text
                                                    .toString();
                                            String price = _controllerPrice.text
                                                .toString();

                                            String categorie =
                                                _controllerCategorie.text
                                                    .toString();
                                            ItemToJson list = ItemToJson(
                                              title: title,
                                              description: description,
                                              price: double.parse(price),
                                              dprice: 0.00,
                                              categorie: categorie,
                                            );
                                            print(list.categorie +
                                                list.description +
                                                list.title +
                                                "${list.price}");
                                            if (widget.itemList == null) {
                                              _apiService
                                                  .createMenu(list)
                                                  .then((isSuccess) {
                                                setState(
                                                    () => _isLoading = false);
                                                if (isSuccess) {
                                                  print("success");
                                                  Navigator.pop(context);
                                                } else {
                                                  print(
                                                      "something troble wrong!!");
                                                }
                                              });
                                            } else {
                                              final id = widget.itemList.id;
                                              print(id);
                                              _apiService
                                                  .updatemenu(list, id)
                                                  .then(
                                                (isSuccess) {
                                                  setState(
                                                      () => _isLoading = false);
                                                  print(isSuccess);
                                                  if (isSuccess) {
                                                    Navigator.pop(context);
                                                  } else {
                                                    print(
                                                        "something troble wrong!!");
                                                  }
                                                },
                                              );
                                            }
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                widget.itemList == null
                                                    ? "Create".toUpperCase()
                                                    : "Update".toUpperCase(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 80,
                        )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
          _isLoading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
