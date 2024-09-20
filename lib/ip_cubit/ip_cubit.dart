import 'package:bloc/bloc.dart';
import 'package:cubit_demo/data/model/ip_details.dart';
import 'package:cubit_demo/data/repository/ip_repository.dart';
import 'package:meta/meta.dart';

part 'ip_state.dart';

class IpCubit extends Cubit<IpState> {
  final IpRepository ipRepository;

  IpCubit(this.ipRepository) : super(IpInitial());

  Future<void> fetchIpDetails() async {
    emit(IpLoading());
    final model = await ipRepository.getIPDetails();
    model != null ? emit(IpResult(ipDetails: model)) : emit(IpInitial());
  }
}
