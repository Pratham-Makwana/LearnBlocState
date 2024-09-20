import 'package:cubit_demo/data/model/ipCart_model.dart';
import 'package:flutter/material.dart';

class IpCard extends StatelessWidget {
  final IPCardModel ipCardModel;

  const IpCard({super.key, required this.ipCardModel});

  @override
  Widget build(BuildContext context) {
    const r = BorderRadius.all(Radius.circular(15));
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
      shape: const RoundedRectangleBorder(borderRadius: r),
      child: InkWell(
        borderRadius: r,
        onTap: () {},
        child: ListTile(
          minLeadingWidth: 0,
          shape: const RoundedRectangleBorder(borderRadius: r),

          /// leading icon
          leading: ipCardModel.icon,

          /// title
          title: Text(ipCardModel.title),

          /// subtitle
          subtitle: Text(ipCardModel.value),
        ),
      ),
    );
  }
}
