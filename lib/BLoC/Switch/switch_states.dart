import 'package:equatable/equatable.dart';

class SwitchStates extends Equatable {
  final bool isSwitch;
  final double value;

  const SwitchStates({this.isSwitch = false, this.value = 0.5});

  SwitchStates copyWith({bool? isSwitch, double? value}) {
    return SwitchStates(
      isSwitch: isSwitch ?? this.isSwitch,
      value: value ?? this.value,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isSwitch,value];
}
