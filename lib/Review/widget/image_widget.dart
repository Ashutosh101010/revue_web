import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:webrevue/service/ServerDetails.dart';

Widget review_image(List images,BuildContext context){
  double width=MediaQuery.of(context).size.width;
  return  Container(
    height: width>=700?width/4:width/2,
    child: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(

                  ServerDetails.get_images+images[index],
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount:images.length,
              pagination: new SwiperPagination(),
            ),
          ),
        ),

        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 30,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.clear,
                    color: Colors.black,
                  )),
            ),
          ),
        ),
      ],
    ),

  );
}