import 'dart:io';

import 'package:flutter/material.dart';
import 'package:leaderboards/db/games.dart';
import 'package:leaderboards/models/game.dart';
import 'package:leaderboards/widgets/GamesList.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as myPath;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


class CreateGamePlayerDialog extends StatefulWidget {

  final Function() onCreateGameCallback;
  CreateGamePlayerDialog(this.onCreateGameCallback);

  @override
  _CreateGamePlayerDialogState createState() => _CreateGamePlayerDialogState();
}

class _CreateGamePlayerDialogState extends State<CreateGamePlayerDialog> {

  // Form Data
  final _gameNameController = TextEditingController();
  final _createGameFormKey = GlobalKey<FormState>();

  // Database
  GamesService gamesService;

  //Image
  File _image;
  final picker = ImagePicker();
  String gameAvatar = '';

  Future getImage() async {

    final  pickedFile = await picker.getImage(source: ImageSource.gallery);
    _cropImage(pickedFile.path);

  }

   _cropImage(filePath) async {

    File croppedImage = await ImageCropper.cropImage(
      sourcePath: filePath,
    );

    if (croppedImage != null) {
      // imageFile = croppedImage;
      setState(() {
        _image = croppedImage;
      });
    }

    // Step 3: Get directory where we can duplicate selected file.
    Directory appDirectoryPath = await getApplicationDocumentsDirectory();
    String appDirPath = appDirectoryPath.path;


    // Step 4: Copy the file to a application document directory. 
    final String fileName = myPath.basename(croppedImage.path);
    final File localImage = await _image.copy('$appDirPath/$fileName');

    setState(() {
        gameAvatar = localImage.path;
      });
  }


   createGame() async {
    Game game = Game();
    game.gameName= _gameNameController.text;
    game.gameAvatar = gameAvatar;
    await gamesService.createGame(game);
    widget.onCreateGameCallback();
    _createGameFormKey.currentState.reset();
  }

  @override
  void initState() {
    super.initState();
    gamesService = GamesService.instance;
  }


  @override
  Widget build(BuildContext context) {
    return  Dialog(
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
                              CircleAvatar(
                                backgroundColor: Colors.grey[700],
                                radius: 50.0,
                                child: CircleAvatar(
                                  backgroundImage:  _image != null ? FileImage(_image) : null,
                                  backgroundColor: Colors.white,
                                  radius: 48.0,
                                  child:  _image != null ? null : Text('Select Image' , 
                                  style: TextStyle(fontSize: 14, color: Colors.black , fontWeight: FontWeight.w400)
                                  ),
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
                                    Navigator.pop(context);
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
                  );
  }
}