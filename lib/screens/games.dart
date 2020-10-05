import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leaderboards/db/datatabase_helper.dart';
import 'package:leaderboards/helper/colorFromHEX.dart';
import 'package:leaderboards/models/game.dart';
import 'package:leaderboards/screens/home.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as myPath;
import 'package:leaderboards/widgets/GamesList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_cropper/image_cropper.dart';

class Games extends StatefulWidget {
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {

  List<Game> games = [];
  bool isImage = false;
  File _image;
  final picker = ImagePicker();
  String _imagePath;
  final _gameNameController = TextEditingController();
  final _createGameFormKey = GlobalKey<FormState>();


  DatabaseHelper _dbHelper;
  Future getImage() async {
    final  pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        isImage = true;
      } else {
        print('No image selected.');
      }
    });

    _cropImage(pickedFile.path);

    // // Step 3: Get directory where we can duplicate selected file.
    // Directory appDirectoryPath = await getApplicationDocumentsDirectory();
    // String appDirPath = appDirectoryPath.path;
    // print('**************################################*###########################################################################');
    // print(appDirPath);
    // // Step 4: Copy the file to a application document directory. 
    // final String fileName = myPath.basename(pickedFile.path);
    // print('**************################################*###########################################################################');
    // print(fileName);
    // final File localImage = await _image.copy('$appDirPath/$fileName');

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('test_image', localImage.path);

    // print('**************################################*###########################################################################');
    // print(prefs.getString('test_image'));


  }

   _cropImage(filePath) async {

    File croppedImage = await ImageCropper.cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    if (croppedImage != null) {
      // imageFile = croppedImage;
      setState(() {
        _image = croppedImage;
      });
    }
  }



  void loadImage() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState((){

    _imagePath = prefs.getString('test_image');
    print('**************################################*###########################################################################');
    print(_imagePath);
    });

  }

  loadGames() async {
  List<Game> gamesData = await _dbHelper.fetchGames();

    setState(() {
      games = gamesData;
    });
  }

   createGame() async {
    Game game = Game();
    game.gameName= _gameNameController.text;
    await _dbHelper.createGame(game);
    await loadGames();
  }
    void onBottomNavigationRedirect(int index) {
    switch (index) {
    case 0:
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
      break;
    case 1:
      break;
    case 2:
      break;
  }
  }

  @override
  void initState() {
    super.initState();
    loadImage();
    _dbHelper = DatabaseHelper.instance;
    loadGames();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFromHEX('#F2F3F4'),
      appBar: AppBar(
            title: Text('Games'),
            backgroundColor: colorFromHEX('#2471A3'),
            centerTitle: true,
          ),
           floatingActionButton:SizedBox(
            width: 70.0,
            height: 70.0,
            child:  FloatingActionButton(
                    onPressed: () {
            
                    showDialog(context: context, child:Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: EdgeInsets.all(10),
                    child: 
                    Form(
                      key: _createGameFormKey,
                      child:Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height:250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                          ),
                          padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                          child: Container(
                          child: Column(children: <Widget>[
                             Row(children: <Widget>[
                               Expanded( flex: 1, child:   InkWell(
                              onTap: () async {
                                await getImage();
                              },
                              child: 
                              _imagePath!=null ? CircleAvatar(
                                  backgroundImage: FileImage(File(_imagePath)),
                                  radius: 48.0,
                                ) :
                              CircleAvatar(
                                backgroundColor: Colors.grey[700],
                                radius: 50.0,
                                child: CircleAvatar(
                                  backgroundImage:  _image != null ? FileImage(_image) : null,
                                  // backgroundColor: Colors.white,
                                  radius: 48.0,
                                  // child: Text('Select Image' , 
                                  // style: TextStyle(fontSize: 14, color: Colors.black , fontWeight: FontWeight.w400)
                                  // ),
                                ),
                              )
                          ), 
                          ),
                          Expanded(flex: 2, 
                          child:
                    TextFormField(
                    autofocus: true,
                    cursorColor: Colors.black,
                    cursorWidth: 2.0,
                    controller: _gameNameController,
                    validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter game name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                  
                  },
                    style: 
                    TextStyle(
                    fontSize: 18.0,
                    height: 1.5,
                    color: Colors.grey[700],
                    ),

                    decoration:  InputDecoration(
                        focusedBorder:OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.grey[700], width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                     enabledBorder:  OutlineInputBorder(
                     borderSide:  BorderSide(color: Colors.grey[700], width: 2.0),
                    ),
                    border:  OutlineInputBorder(
                    borderRadius:  BorderRadius.all(
                       Radius.circular(25.0),
                    ),
                    ),
                    filled: true,
                    hintStyle:  TextStyle(color: Colors.grey[400]),
                    hintText: "Enter Game Name",
                    fillColor: Colors.white70
                    )
                    ),
                      )
                             ],
                             ),
                          SizedBox(height: 30),
                             Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            fontSize: 20
                            ),
                          ),
                        ),
                        RaisedButton(
                        elevation: 2.0,
                        color: Colors.blue[900],
                        onPressed: () async {
                        if (_createGameFormKey.currentState.validate()) {
                                    _createGameFormKey.currentState.save();

                                    await createGame();
                              }
                        },
                        child:
                        Row(
                        children: <Widget>[
                        Text(
                          'Create Game',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                            ),    
                            ],
                            ),      
                            padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                        ),
                        ),
                        ],
                        ),
                        ],
                        ),
                        )
                        )
                      ],
                    ),
                    )
                    
       
                  ));
                      
                      },
                      child: Icon(Icons.add),
                      backgroundColor:  colorFromHEX('#2471A3'),
                    ),
        ),
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorFromHEX('#FDFEFE'),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
             BottomNavigationBarItem(
            icon: Icon(Icons.home,
            size: 30,
            color: colorFromHEX('#424949'),
            ),
            title: Text('Home',
             style: TextStyle(
              fontSize: 14,
                              color: colorFromHEX('#424949'),

            )),
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.logo_game_controller_b , size: 30),
            title: Text('Games',
            style: TextStyle(
              fontSize: 14,
            )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: 30,
              color: colorFromHEX('#424949'),
              ),
            title: Text('Players' ,
             style: TextStyle(
              fontSize: 14,
              color: colorFromHEX('#424949'),
            )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.md_trophy,
             size: 30,
            color: colorFromHEX('#424949'),
             ),
            title: Text('Winners',
             style: TextStyle(
              fontSize: 14,
              color: colorFromHEX('#424949'),

            )),
          ),
      
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.school),
          //   title: Text('Buzzer'),
          // ),
        ],
        currentIndex: 1,
        // selectedItemColor: Colors.amber[800],
        onTap: onBottomNavigationRedirect,
        ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex:1,
                  child:  Container(
                decoration:  BoxDecoration(
                  color: colorFromHEX('#2471A3'),
                  borderRadius: new BorderRadius.only(
                    bottomLeft:const Radius.circular(40.0),
                    bottomRight: const Radius.circular(40.0),
                  )
                ),
                    child: null
                    ) 
                    ),
                      Expanded(
                        flex: 3,
                child: games.length > 0 ? GamesList(games):
                new Center(child:
                new Text('There are no games', style: Theme.of(context).textTheme.title)),
                ), 
            ],
            ),
        ),
    );
  }
}