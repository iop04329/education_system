import 'package:education_system/account/data/accountRepository.dart';
import 'package:education_system/account/domain/account.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountCtrProvider = Provider.autoDispose<accountController>((ref) {
  final _accountRepo = ref.watch(accountRepoProvider);
  return accountController(_accountRepo, ref);
});

class accountController {
  final accountRepo _accountRepo;
  final Ref _ref;
  accountController(this._accountRepo, this._ref);

  Future<List<accountData>> getDatas() async {
    final accounts = await _accountRepo.fetchList();
    return accounts;
  }

  Future<bool> login(String account, String password) async {
    final accounts = await _accountRepo.fetchList();
    int ind = accounts.indexWhere((element) => element.account == account && element.password == password);

    return ind == -1 ? false : true;
  }

  Future<bool> register(accountData data) async {
    return await _accountRepo.insert(data);
  }

  Future<bool> edit(accountData data) async {
    return await _accountRepo.edit(data);
  }

  Future<bool> delete(int id) async {
    return await _accountRepo.delete(id);
  }
}
