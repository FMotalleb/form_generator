import 'package:isar/isar.dart';

class IsarDbRepository {
  final Isar _isar;
  IsarDbRepository({required Isar isar}) : _isar = isar;

  Future<T> write<T>(
    Future<T> Function(Isar) callback, {
    bool silent = false,
  }) =>
      _isar.writeTxn(
        callback,
        silent: silent,
      );
  Future<T> read<T>(
    Future<T> Function(Isar) callback,
  ) =>
      _isar.txn(
        callback,
      );
  Future<void> clean() => _isar.clear();
}
