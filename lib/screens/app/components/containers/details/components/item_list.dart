import 'dart:io';
import 'package:food_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/screens/app/components/containers/details/components/item_card.dart';
import 'package:food_app/screens/app/components/containers/details/components/loadingintg.dart';
import 'package:food_app/screens/app/components/models/item_lists_models.dart';
import 'package:food_app/screens/app/components/service/menu_items_api_connection.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ItemList extends StatelessWidget {
  int id;
  int lid;
  ItemList({Key key, this.id, this.lid}) : super(key: key);
  IntGAPI apiService = IntGAPI();
  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    return FutureBuilder(
      future: apiService.getIntG(lid),
      builder: (BuildContext context, AsyncSnapshot<List<IntG>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            List<IntG> itemLists = snapshot.data;
            if (itemLists.length > 0) {
              return Container(
                height: 230,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemLists.length + 1,
                    itemBuilder: (context, index) {
                      if (id == null) {
                        if (index == itemLists.length) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AddIntG(lid: lid);
                                  },
                                ),
                              );
                            },
                            child: Container(
                              height: 120,
                              width: 120,
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.grey[100]),
                                  right: BorderSide(
                                      width: 1, color: Colors.grey[100]),
                                  left: BorderSide(
                                      width: 1, color: Colors.grey[100]),
                                  top: BorderSide(
                                      width: 1, color: Colors.grey[100]),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    padding: EdgeInsets.all(14),
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor.withOpacity(0.13),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                    ),
                                  ),
                                  Container(
                                    height: 16,
                                    margin: EdgeInsets.only(top: 10),
                                    width: double.infinity,
                                    child: Text(
                                      "Add New",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      }

                      IntG list = itemLists[index];
                      return Container(
                        height: 200,
                        child: ItemCard(
                          imgsrc:
                              "https://www.mcdonalds.com/content/dam/usa/nfl/nutrition/ingredients/regular/10_1_patty.png",
                          title: list.title != null ? list.title : "",
                          press: () {
                            id == null
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return AddIntG(list: list, lid: lid);
                                      },
                                    ),
                                  )
                                // ignore: unnecessary_statements
                                : null;
                          },
                        ),
                      );
                    }),
              );
            }
          }
        }
        return Container(
          height: 140,
          child: LoadingIntg(),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class AddIntG extends StatefulWidget {
  IntG list;
  int lid;
  AddIntG({Key key, this.list, this.lid}) : super(key: key);

  @override
  _AddIntGState createState() => _AddIntGState(list, lid);
}

class _AddIntGState extends State<AddIntG> {
  IntG list;
  int lid;
  IntGAPI _intGapi = IntGAPI();
  _AddIntGState(this.list, this.lid);
  // ignore: unused_field
  bool _isLoading = false;
  // MenuApiService _apiService = MenuApiService();
  // ignore: unused_field
  bool _isFieldTitleValid;
  // bool _isFieldDPriceValid;
  TextEditingController _controllerTitle = TextEditingController();

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
    if (widget.list != null) {
      _isFieldTitleValid = true;
      _controllerTitle.text = widget.list.title;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.list == null ? "Create" : "Update" + " Integradiands"),
        actions: <Widget>[
          widget.list != null
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Warning"),
                            content: Text(
                                "Are you sure want to delete ${list.title}?"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("Yes"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  _intGapi
                                      .deleteIntG(lid, list.id)
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
                        });
                  })
              : Container(),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 11),
              Text("Select Poster"),
              SizedBox(height: 11),
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
              SizedBox(height: 11),
              _image != null ? Image.file(_image) : Container(),
              SizedBox(height: 11),
              Text(
                "Title (Required)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
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
                      setState(() => _isLoading = true);
                      String title = _controllerTitle.text.toString();
                      if (widget.list == null) {
                        IntG crdata = IntG(title: title, poster: "");
                        _intGapi.createIntG(crdata, lid).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            print("success");
                            Navigator.pop(context);
                          } else {
                            print("something troble wrong!!");
                          }
                        });
                      } else if (widget.list != null) {
                        IntG updata =
                            IntG(id: list.id, title: title, poster: "");
                        print(
                            "Update--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
                        _intGapi
                            .updateIntG(updata, lid, list.id)
                            .then((isSuccess) {
                          setState(() => _isLoading = false);
                          print(isSuccess);
                          if (isSuccess) {
                            Navigator.pop(context);
                          } else {
                            print("something troble wrong!!");
                          }
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.list == null
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
              // _isLoading
              //     ? Stack(
              //         children: <Widget>[
              //           Opacity(
              //             opacity: 0.3,
              //             child: ModalBarrier(
              //               dismissible: false,
              //               color: Colors.grey,
              //             ),
              //           ),
              //           Center(
              //             child: CircularProgressIndicator(),
              //           ),
              //         ],
              //       )
              //     : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
