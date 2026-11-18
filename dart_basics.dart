// Student: Malla Hasaballa Ahmed Haggar
// Reg no: 25363/2024
const String regNo = '25363';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

//B2
int countVowels(String text) {
  // By MH
  text = text.toLowerCase();
  int count = 0;

  for (int i = 0; i < text.length; i++) {
    if ("aeiou".contains(text[i])) {
      count++;
    }
  }

  return count;
}

//B3
String initials(String fullName) {
  // By MH
  fullName = fullName.trim();

  if (fullName.isEmpty) {
    return "";
  }

  List<String> names = fullName.split(RegExp(r'\s+'));
  String result = "";

  for (String name in names) {
    result += "${name[0].toUpperCase()}.";
  }

  return result;
}

//C5
void drawTriangle(int height) {
  // By MH
  if (height <= 0) {
    return;
  }

  for (int i = 1; i <= height; i++) {
    String spaces = ' ' * (height - i);
    String symbol = (i % 2 == 1) ? '*' : '#';

    print(spaces + (symbol * i));
  }
}

//D2
int momoFee(int amount) {
  // By MH
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String maskPhone(String phone) {
  // By MH
  if (phone.length != 10) {
    return "INVALID";
  }

  return phone.substring(0, 3) + "*" * 5 + phone.substring(8);
}

void main() {
  //By MH

  print('Reg no: $regNo | D = $d | T = $t');

  //B2
  String fullName = "Moalla Hasaballa Ahmed Haggar";

  print("$fullName has ${countVowels(fullName)} vowels");

  //B3
  print(initials("Moalla Hasaballa Ahmed Haggar"));
  print(initials(" ana uwase "));
  print(initials(" "));

  //C5
  int D = 4;

  drawTriangle(D + 3);
  drawTriangle(0);
  drawTriangle(-2);

  //D2
  int DD = 4;
  int T = 57;
  int i = 1;
  int totalFees = 0;

  String phone = "0788123456";

  while (i <= DD + 3) {
    int amount = i * 4000 + T * 100;
    int fee = momoFee(amount);

    print("Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}");

    totalFees += fee;
    i++;
  }

  print("Total fees: $totalFees RWF");
}
