// Student: Malla Hasaballa Ahmed Haggar
// Reg no: 25363
const String regNo = '25363';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void main() {
  //By MH
  print('Reg no: $regNo | D = $d | T = $t');
}
