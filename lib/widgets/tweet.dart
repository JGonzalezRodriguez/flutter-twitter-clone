import 'dart:developer';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget tweet(
    String text, String name, String handle, int comments, int rt, int fav) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey,
        ),
      ),
      Expanded(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text(name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          '@' + handle.replaceAll(" ", ""),
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        Text(
                          ' · 10m',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 12,
                        splashRadius: 12,
                        icon: Icon(
                          Icons.more_vert_outlined,
                          size: 15,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              Text(text),
              Container(
                padding: EdgeInsets.fromLTRB(0, 8, 24, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FontAwesomeIcons.comment,
                            color: Colors.grey,
                            size: 16,
                          ),
                          Text(
                            comments != 0 ? comments.toString() : '',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FontAwesomeIcons.retweet,
                            color: Colors.grey,
                            size: 18,
                          ),
                          Text(
                            rt != 0 ? rt.toString() : '',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_outline,
                            color: Colors.grey,
                            size: 18,
                          ),
                          Text(
                            fav != 0 ? fav.toString() : '',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.upload_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
