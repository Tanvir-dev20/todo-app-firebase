import 'package:flutter/material.dart';

Widget buildCard({
  required String title,
  required String desc,
  required String createdDate,
  required String status,
  required VoidCallback onDelete}){
  return Card(
                color: Colors.deepPurple,
                child: ListTile(
                  textColor: Colors.white,
                  onLongPress: () {
                  },
                  title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(desc),
                      Text('Created Date: $createdDate'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 10,),
                          Text(status),
                      IconButton(onPressed: onDelete, 
                      icon: Icon(Icons.delete,color: Colors.white,size: 25,)),
                    ],
                  ),
                ),
              );
}