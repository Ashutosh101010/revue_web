import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/model/ReviewModal.dart';

class AddImageReview extends StatefulWidget{

  AddImageReview({Key key}):super(key: key);

  @override
  State<StatefulWidget> createState() {
   return AddImageReviewState();
  }
}

class AddImageReviewState extends State<AddImageReview>{

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }


Future<void> getImages(ReviewModal reviewModal)async{
    List<MultipartFile> tempList =[];

    for(XFile xFile in imageFileList){
      print(xFile.mimeType);

      Uint8List  bytes  = await xFile.readAsBytes();
      ByteData byteData =  ByteData.view(bytes.buffer);
      List<int> imageData = byteData.buffer.asInt8List();
      // print(imageData);

      MultipartFile multipartFile = new MultipartFile.fromBytes( "imageData",
        imageData,filename:xFile.name,);
      // print(multipartFile.filename);

      tempList.add(multipartFile);

    }

    print("templist"+tempList.toString());
    reviewModal.multipartImages = tempList;

  }




  void _onImageButtonPressed(ImageSource source,
      {BuildContext context, bool isMultiImage = false}) async {

    if (isMultiImage) {
      try {
        final pickedFileList = await _picker.pickMultiImage(imageQuality: 50,maxHeight: 480, maxWidth: 640);
        setState(() {
          imageFileList = pickedFileList;
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    }

    setState(() {

    });

  }


  Widget _previewImages() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (imageFileList != null) {
      return Semantics(
          child: GridView.builder(
            key: UniqueKey(),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,),
            itemBuilder: (context, index) {
              return Semantics(
                label: 'pick images',
                child: kIsWeb
                    ? Container(
                    height: 40,width: 40,
                    margin: EdgeInsets.all(10),
                    child: Image.network(imageFileList[index].path,fit: BoxFit.fill,))
                    : Image.asset(""),
              );
            },
            itemCount: imageFileList.length,
          ),
          label: 'pick images');
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  // Future<void> retrieveLostData() async {
  //   final LostDataResponse response = await _picker.retrieveLostData();
  //   if (response.isEmpty) {
  //     return;
  //   }
  //   if (response.file != null) {
  //     setState(() {
  //       _imageFile = response.file;
  //     });
  //   } else {
  //     _retrieveDataError = response.exception.code;
  //   }
  // }

  bool imageValidate = false;


  @override
  Widget build(BuildContext context) {
   return  Container(
     width: MediaQuery.of(context).size.width,
     margin:EdgeInsets.only(top: 10,bottom: 10),
     decoration: BoxDecoration(
         color: Colors.grey.shade50,
         border: Border.all(color: Colors.black12)
     ),
     child:  Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [

         Padding(
             padding: EdgeInsets.only(left: 20,right: 20,top: 20),
             child: Text("Upload Images", style: TextStyle(
                 color:  ColorClass.blueColor,
                 fontWeight: FontWeight.w600,
                 fontStyle:  FontStyle.normal,
                 fontSize: 18.0
             ),
                 textAlign: TextAlign.left)
         ),
         Container(margin: EdgeInsets.only(left:30,right:30,top:10,bottom: 10),
             child:  imageFileList.isEmpty
                 ? Padding(
                 padding: const EdgeInsets.all(8.0),
                 child:// Rectangle 54
                 Container(
                   width:MediaQuery.of(context).size.width,
                   height: 133,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(
                           Radius.circular(5)
                       ),
                       border: Border.all(
                           color: Colors.grey,
                           width: 1
                       ),
                       color: Colors.white
                   ),
                   child: InkWell(
                       mouseCursor: SystemMouseCursors.click,
                       onTap: (){
                         _onImageButtonPressed(
                           ImageSource.gallery,
                           context: context,
                           isMultiImage: true,

                         );
                       },
                       child: Image.asset("assets/images/addCamera.png",
                         width: 15,height: 15,)),
                 )
             ) :_handlePreview()),

         imageValidate?Padding(
           padding: const EdgeInsets.only(left: 40),
           child: Text("Images cannot be empty",style: TextStyle(color: ColorClass.redColor),),
         ):Container()

       ],
     ),
   );
  }
  Widget _handlePreview() {
    return _previewImages();
  }


  List<XFile> imageFileList=[];

  final ImagePicker _picker = ImagePicker();

  set _imageFile(XFile value) {
    imageFileList = value == null ? null : [value];
  }

  dynamic _pickImageError;

  String _retrieveDataError;



  bool validate(){
    return imageFileList.isNotEmpty;
  }


}