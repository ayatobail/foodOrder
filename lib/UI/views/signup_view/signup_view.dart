
import 'dart:io';



import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_button.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_textField.dart';
import 'package:food_order/UI/views/login_view/login_view.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:food_order/UI/views/reset_password_screen/reset_password_screen.dart';

import '../../shared/colors.dart';
import '../../shared/utilis.dart';
import '../reset_password_view/reset_password_screen.dart';
class signupView extends StatefulWidget {
  const signupView({Key? key}) : super(key: key);

  @override
  _signupViewState createState() => _signupViewState();
}

class _signupViewState extends State<signupView> {
  @override

  TextEditingController  emailController=TextEditingController();
  TextEditingController  passwordController=TextEditingController();
  TextEditingController  nameController=TextEditingController();
  TextEditingController  mobileNoController=TextEditingController();
  TextEditingController  adressController=TextEditingController();
  TextEditingController  confirmPasswordController=TextEditingController();

  final ImagePicker picker = ImagePicker();
  FileModel? selectedFile;
  bool showOptions = false;





  GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(child:
    Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding:  EdgeInsets.only(top: size.width*0.1,bottom: size.width*0.04),
              child: Text("Sign Up",textAlign: TextAlign.center,style: TextStyle(fontSize:size.width*0.06 )),
            ),

            Text("Add your details to sign up",textAlign: TextAlign.center,style: TextStyle(color: AppColors.mainBlackColor,fontSize: size.width*0.03),),

            Center(
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  InkWell(
                    onTap: selectedFile == null || selectedFile!.path.isEmpty
                        ? () {
                      setShowOPtion(true);
                    }
                        : null,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.mainOrangeColor,
                      child: selectedFile == null
                          ? Icon(Icons.person)
                          : selectedFile!.path.isNotEmpty &&
                          selectedFile!.type == FileType.FILE
                          ? Icon(Icons.file_copy)
                          : selectedFile!.path.isNotEmpty
                          ? Image.file(File(selectedFile!.path))
                          : Icon(Icons.person),
                    ),
                  ),
                  Visibility(
                      visible:
                      selectedFile != null && selectedFile!.path.isNotEmpty,
                      child: InkWell(
                        onTap: () {
                          setShowOPtion(true);
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColors.mainWhiteColor,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: showOptions,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customButton(
                    text: 'Camera',
                    onPressed: () {
                      pickFile(FileType.CAMERA)
                          .then((value) => selectedFile = value);
                    },
                  ),
                  customButton(
                    text: 'Gallery',
                    onPressed: () {
                      pickFile(FileType.GALLERY)
                          .then((value) => selectedFile = value);
                    },
                  ),
                  customButton(
                    text: 'File',
                    onPressed: () {
                      pickFile(FileType.FILE).then((value) => selectedFile = value);
                    },
                  ),
                ],
              ),
            ),



            Padding(
              padding:  EdgeInsets.only(top: size.width*0.03,bottom: size.width*0.05),
              child: customTextField(hintTExt: "Name", controller: nameController,validator: (value){
                                   return value!.isEmpty|| !isNameValid(value)? "please check your name": null;}),
            ),
            customTextField(hintTExt: "Email", controller: emailController,validator: (value){
              return value!.isEmpty|| !isEmail(value)? "please check email": null;}),
            SizedBox(height: size.width*0.05,),
            customTextField(hintTExt: "Mobile No", controller: mobileNoController,validator: (value){
              return value!.isEmpty|| !isPhoneValid(value)? "please check your phone number":null;
            },),
            SizedBox(height: size.width*0.05,),
            customTextField(hintTExt: "Address", controller: adressController),
            SizedBox(height: size.width*0.05,),
            customTextField(hintTExt: "Password", controller: passwordController,validator: (value){
                                   return value!.isEmpty|| !isPasswordValid(value)? "please check password": null;}),
            SizedBox(height: size.width*0.05,),
            customTextField(hintTExt: "Confirm Password", controller:confirmPasswordController,validator: (value){
              return value!.isEmpty||value!=passwordController.text?"passwords don't match":null;
            },),
            SizedBox(height: size.width*0.05,),
            customButton(text: "Sign Up", onPressed:(){
              if(_formkey.currentState!.validate()) {
                print("everything is ok");
                 Navigator.push(context, MaterialPageRoute(
                   builder: (context) {
                    return resetPasswordScreen();

              }));
              }
              else
                print(":(");



            }),
            SizedBox(height: size.width*0.13,),

            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Text("Already have an Account? ",style: TextStyle(fontSize: size.width*0.03,color: AppColors.mainBlackColor)),
                GestureDetector(child:
                Text("Login ",style: TextStyle(fontSize: size.width*0.03,fontWeight:FontWeight.bold,color: AppColors.mainOrangeColor),),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return LoginView();
                    }));
                  },
                ),
              ],)


          ],),
        ),
      ),
    ));
  }

  void setShowOPtion(bool value) {
    setState(() {
      showOptions = value;
    });
  }

  Future<FileModel> pickFile(FileType type) async {
    String path = '';

    switch (type) {
      case FileType.CAMERA:
        await picker
            .pickImage(source: ImageSource.camera)
            .then((value) => path = value?.path ?? '');
        break;
      case FileType.GALLERY:
        await picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => path = value?.path ?? '');
        break;
      case FileType.FILE:
        await FilePicker.platform
            .pickFiles()
            .then((value) => path = value?.paths[0] ?? '');
        break;
    }
    setShowOPtion(false);
    return FileModel(path.isNotEmpty ? path : selectedFile!.path,
        path.isNotEmpty ? type : selectedFile!.type);
  }
}

class FileModel {
  FileType type;
  String path;

  FileModel(this.path, this.type);
}

enum FileType { CAMERA, GALLERY, FILE }


