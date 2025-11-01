import 'package:fast_app_base/common/constants.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank.dart';

const _bankImagePath = "$basePath/bank";

// MARK: - Dummy
final bankShinhan =
    Bank(name: "신한은행", lgoImagePath: '$_bankImagePath/bank_shinhan.png');
final bankKakao =
    Bank(name: "카카오 뱅크", lgoImagePath: "$_bankImagePath/bank_kakao.png");
final bankToss =
    Bank(name: "토스 뱅크", lgoImagePath: "$_bankImagePath/bank_toss.png");
