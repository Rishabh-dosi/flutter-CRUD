import 'dart:io';

void main(){
  // stdout.write("hey buddy");
  print("Lets Go");
  String? naam = stdin.readLineSync();
  print("My name is : $naam");
  //declaring nullable variable
  int? a;
  // print(a); output will be null
  //calling objects;
  if(naam != null){
    Person p = Person(naam, 12);
    print("\n name: ${p.name}");
  }


}
class Person{
  String name;
  int num;
  Person(this.name , this.num);
}