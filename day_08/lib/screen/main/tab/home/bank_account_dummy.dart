import 'package:fast_app_base/screen/main/tab/home/banks.dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(
    bank: bankShinhan, balance: 3000000, accountTypeName: "신한 주거래 우대통장(저축예금)");

final bankAccountShinhan2 =
    BankAccount(bank: bankShinhan, balance: 30000000, accountTypeName: "저축예금");

final bankAccountShinhan3 =
    BankAccount(bank: bankShinhan, balance: 30000000, accountTypeName: "저축예금");

final bankAccountKakao = BankAccount(bank: bankKakao, balance: 3000000);

final bankAccountToss =
    BankAccount(bank: bankToss, balance: 999000, accountTypeName: "입출금통장");

final List<BankAccount> bankAccountDummys = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao,
  bankAccountToss,
];

// MARK: TEST
// main() {
//   print("test");
// }
