// Part F: MoMo USSD Simulator
// By MH

// Function 1: Format RWF
String formatRwf(int amount) {
  // By MH
  bool negative = amount < 0;
  String number = amount.abs().toString();
  String result = "";
  int i = number.length - 1;
  int count = 0;

  while (i >= 0) {
    if (count == 3) {
      result = "," + result;
      count = 0;
    }

    result = number[i] + result;
    count++;
    i--;
  }

  if (negative) {
    result = "-" + result;
  }

  return "$result RWF";
}

// Function 2: Validate PIN
bool isValidPin(String pin) {
  // By MH
  if (pin.length != 5) return false;
  if (pin == "12345") return false;

  int i = 0;
  bool same = true;

  while (i < pin.length) {
    if (!"0123456789".contains(pin[i])) {
      return false;
    }

    if (pin[i] != pin[0]) {
      same = false;
    }

    i++;
  }

  if (same) return false;

  return true;
}

// Function 3: MoMo Fee
int momoFee(int amount) {
  // By MH
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;

  return 1500;
}

// Function 4: Send Money
int sendMoney(int balance, int amount) {
  // By MH
  int fee = momoFee(amount);

  if (fee == -1) {
    print("Failed: invalid amount");
    return balance;
  }

  if (amount + fee > balance) {
    print("Failed: insufficient balance");
    return balance;
  }

  balance = balance - amount - fee;

  print(
    "Sent ${formatRwf(amount)} "
    "(fee ${formatRwf(fee)}). "
    "New balance: ${formatRwf(balance)}",
  );

  return balance;
}

// Function 5: Buy Airtime
int buyAirtime(int balance, int amount) {
  // By MH
  if (amount < 100 || amount > 50000) {
    print("Failed: invalid airtime amount");
    return balance;
  }

  if (amount > balance) {
    print("Failed: insufficient balance");
    return balance;
  }

  balance = balance - amount;

  print(
    "Airtime purchased: ${formatRwf(amount)}. "
    "New balance: ${formatRwf(balance)}",
  );

  return balance;
}

// Main Function
void main() {
  // By MH

  int D = 4;
  int T = 57;

  // Test PINs
  print("=== PIN VALIDATION ===");

  print(isValidPin("12345"));
  print(isValidPin("4821$D"));
  print(isValidPin("77777"));
  print(isValidPin("4821"));
  print(isValidPin("48a21"));

  // Starting Balance
  int balance = 20000 + T * 500;

  print("\n=== MOMO TRANSACTIONS ===");

  print("Starting balance: ${formatRwf(balance)}");

  // Send money three times
  int i = 1;

  while (i <= 3) {
    balance = sendMoney(balance, (D + 1) * 3000);
    i++;
  }

  // Buy Airtime
  balance = buyAirtime(balance, 1000);

  // Send Invalid Amount
  balance = sendMoney(balance, 0);

  // Send Large Amount
  balance = sendMoney(balance, 200000);

  // Final Balance
  print("Final balance: ${formatRwf(balance)}");

  // Additional Tests
  print("\n=== ADDITIONAL TESTS ===");

  // Expected: 0 RWF
  print(formatRwf(0));

  // Expected: 1,000 RWF
  print(formatRwf(1000));

  // Expected: -5,000 RWF
  print(formatRwf(-5000));

  // Expected: 1,250,000 RWF
  print(formatRwf(1250000));

  // Expected: true
  print(isValidPin("48214"));

  // Expected: false
  print(isValidPin("00000"));

  // Expected: false (letters are invalid)
  print(isValidPin("12a45"));

  // Expected: false (empty PIN)
  print(isValidPin(""));
}
