part of 'add_form_page.dart';

abstract class AddFormPageState extends Equatable {
  const AddFormPageState();

  @override
  List<Object> get props => [];
}

class AddFormPageStateInitial extends AddFormPageState {}

class AddFormPageStateValue extends AddFormPageState {
  final List<FormEntity> forms;

  const AddFormPageStateValue({required this.forms});

  @override
  List<Object> get props => [...forms];
}
