import '../../src/core/handlers/handlers.dart';
import '../../modify/models/models.dart';

abstract class TicketsRepository {
  Future<dynamic> createTicket(TicketData ticket, String fileOrdersId);
  Future<ApiResult<TicketsResponse>> searchTickets(dynamic queryParam);
}
