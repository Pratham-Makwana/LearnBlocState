import 'package:cubit_demo/data/model/ipCart_model.dart';
import 'package:cubit_demo/data/model/ip_details.dart';
import 'package:cubit_demo/ip_cubit/ip_cubit.dart';
import 'package:cubit_demo/ip_cubit/ip_cubit.dart';
import 'package:cubit_demo/presentation/widgets/ipcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IpScreen extends StatelessWidget {
  const IpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("IP List"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: context.read<IpCubit>().fetchIpDetails,
          child: const Icon(Icons.refresh),
        ),
        body: BlocBuilder<IpCubit, IpState>(
          builder: (context, state) {
            if (state is IpInitial) return _resultList(state.ipDetails);
            if (state is IpLoading) {
              return const Center(
                child:  CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              );
            }
            if (state is IpResult) return _resultList(state.ipDetails);
            return const SizedBox();
          },
        ));
  }

  Widget _resultList(IPDetailsModel model) => ListView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        children: [
          IpCard(
            ipCardModel: IPCardModel(
              title: 'IP Address',
              value: model.query,
              icon: const Icon(
                CupertinoIcons.location_solid,
                size: 28,
                color: Colors.blue,
              ),
            ),
          ),
          IpCard(
            ipCardModel: IPCardModel(
              title: 'Internet Provider',
              value: model.isp,
              icon: const Icon(
                Icons.business,
                size: 28,
                color: Colors.orange,
              ),
            ),
          ),
          IpCard(
            ipCardModel: IPCardModel(
              title: 'Location',
              value: model.country,
              icon: const Icon(
                CupertinoIcons.location,
                size: 28,
                color: Colors.pink,
              ),
            ),
          ),
          IpCard(
            ipCardModel: IPCardModel(
              title: 'Pin-Code',
              value: model.zip,
              icon: const Icon(
                CupertinoIcons.location_solid,
                size: 28,
                color: Colors.cyan,
              ),
            ),
          ),
          IpCard(
            ipCardModel: IPCardModel(
              title: 'TimeZone',
              value: model.timezone,
              icon: const Icon(
                CupertinoIcons.time,
                size: 28,
                color: Colors.green,
              ),
            ),
          ),
        ],
      );
}
