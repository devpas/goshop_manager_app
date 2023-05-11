import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_manager_app/modify/presentation/components/buttons/ticket_item.dart';
import 'package:g_manager_app/modify/riverpob/providers/providers.dart';

import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';

class ListTicketModal extends ConsumerStatefulWidget {
  const ListTicketModal({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ListTicketModalState();
}

class _ListTicketModalState extends ConsumerState<ListTicketModal> {
  int selectTicket = 0;

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(posSystemPASProvider);
    final notifier = ref.read(posSystemPASProvider.notifier);
    return Material(
      color: AppColors.mainBackground,
      child: Container(
        padding: REdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Stack(
          children: [
            ListView.builder(
              padding: REdgeInsets.symmetric(vertical: 10),
              physics: const CustomBouncingScrollPhysics(),
              itemCount: state.listTicket!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final ticket = state.listTicket![index];
                return TicketItem(
                  title: "${ticket.title}" "\n ${state.infoSelected![0][1]}",
                  isSelected: index == selectTicket ? true : false,
                  onDelete: () {
                    print(index);
                    notifier.deleteTicket(index);
                    notifier.updateIndex(
                        "ticket", state.listTicket!.length - 1);
                  },
                  onTap: () {
                    setState(() {
                      selectTicket = index;
                      notifier.updateIndex("ticket", index);
                      context.popRoute();
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
