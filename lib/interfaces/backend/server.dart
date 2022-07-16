import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:klodden/interfaces/backend/cache.dart';
import 'package:klodden/interfaces/backend/functions.dart';

connectCatalog(price,minDeposit,material,color,style,gender) async {
String clothid = getRandomString(7); 
await FirebaseFirestore.instance
                            .collection('uploads')
                            .doc(clothid)
                            .set(
                            { 
                              'image':sharedPrefs.imagepath,
                               'clothid': clothid,
                               'price': price ,
                               'gender': gender,
                               'minDeposit':minDeposit,
                               'material':material,
                               'colour':color,
                               'style':style,
                              }
                          ).catchError((e) {//s = 'Error';
                          });
}

connectFav() async {
  await FirebaseFirestore.instance
                            .collection('Info')
                            .doc('Client')
                            .set(
                            { 
                              'fav': sharedPrefs.favid, 
                              }
                          ).catchError((e) {//s = 'Error';
                          });
}

uploadRedCust(id) async {
   await FirebaseFirestore.instance
                            .collection('Info')
                            .doc('Client')///replace with username
                            .set(
                            { 
                              'tailor': 'tailorsusername',
                              'id': id,
                              'clothimage':''
                              }
                          ).catchError((e) {//s = 'Error';
                          });
}

uploadRedTail(id) async {
   await FirebaseFirestore.instance
                            .collection('Info')
                            .doc('Client')//Replace with tailor username
                            .set(
                            { 
                              'clothid': id, 
                              'client':'clientusername'
                              }
                          ).catchError((e) {//s = 'Error';
                          });
}