import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EnableOrDisableNotification extends SwitchEvents {}

class ChangeOpacity extends SwitchEvents {
  final double opacityValue;

  const ChangeOpacity({required this.opacityValue});
}
