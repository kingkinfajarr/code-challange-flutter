import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_transisi/src/common_widgets/common_widgets.dart';
import 'package:flutter_transisi/src/constants/app_sizes.dart';
import 'package:flutter_transisi/src/constants/app_themes.dart';
import 'package:flutter_transisi/src/features/employees/domain/employees_detail.dart';
import 'package:flutter_transisi/src/features/employees/presentation/detail_employees/controllers/detail_employees_controller.dart';

class DetailEmployeesPage extends ConsumerStatefulWidget {
  final int employeesId;
  const DetailEmployeesPage({
    super.key,
    required this.employeesId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailEmployeesPageState();
}

class _DetailEmployeesPageState extends ConsumerState<DetailEmployeesPage> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      ref
          .read(detailEmployeesControllerProvider.notifier)
          .getEmployeesById(id: widget.employeesId);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final employeesDetail = ref.watch(detailEmployeesControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: SafeArea(
        child: Center(
          child: AsyncValueWidget<EmployeesDetail>(
            value: employeesDetail,
            data: (detailEmployees) {
              return _content(detailEmployees);
            },
          ),
        ),
      ),
    );
  }

  Widget _content(EmployeesDetail detailEmployees) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 300,
          child: CachedNetworkImage(
            imageUrl: detailEmployees.avatar,
            fit: BoxFit.cover,
          ),
        ),
        Gap.h16,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama Lengkap : ${detailEmployees.firstName} ${detailEmployees.lastName}",
                style: AppThemes.headline1,
              ),
              Text(
                "Email : ${detailEmployees.email}",
                style: AppThemes.text1,
              )
            ],
          ),
        )
      ],
    );
  }
}
