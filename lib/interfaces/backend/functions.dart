 import 'dart:math'; 

 int idNum() { 
                  var rnd = Random();
                    var next = rnd.nextDouble()*10000;
                    while (next < 10000){
                    next*=10;
                  }
                  int reslt = next.toInt();
                  return reslt;
  }

 
String getRandomString(int len){
  var r = Random();
  const _chars = 'A1B2CD3EF4G5H6I7J8K9L0MNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  return List.generate(len,(index)=>_chars[r.nextInt(_chars.length)]).join();
}
 