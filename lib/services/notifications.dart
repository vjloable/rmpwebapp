import 'package:rmpwebapp/services/notifications.dart';
import 'package:rmpwebapp/structures/order.dart';

class Notifications {
  static Map<String,List<NotificationBox>> notifs = {
    'Iligan 1' : [],
    'Iligan 2' : [],
    'Kapatagan' : [],
    'Maranding' : [],
    'Aurora' : [],
    'Admin' : [],
  };

  static List<NotificationBox> getNotifBox(String user){
    List<NotificationBox> nb = [];
    if (notifs[user] != null) {
      nb = notifs[user] as List<NotificationBox>;
    }else{
      nb = [];
    }
    return nb;
  }

  static void notify(String user, Order order, int msgtype){
    List<NotificationBox>? n = notifs[user];
    NotificationBox nb = NotificationBox(user: user, order: order, msgtype: msgtype);
    nb.setMessage();
    n?.add(nb);
  }

  static void warn(){
    Order order = Order('', '', '', 0, [], '');
    List<NotificationBox>? n = notifs['Admin'];
    NotificationBox nb = NotificationBox(user: 'Admin', order: order, msgtype: 4);
    nb.setMessage();
    n?.add(nb);
  }

  static void hasReadAll(String user){
    List<NotificationBox>? n = notifs[user];
    if(n != null){
      n.forEach((element) {element.readNotif();});
    }
  }

  static bool checkReadAll(String user){
    List<NotificationBox>? n = notifs[user];
    bool ret = false;
    if(n != null){
      n.forEach((element) {
        ret = ret || !element.isRead;
      });
    }else{
      ret = false;
    }
    return ret;
  }
}

class NotificationBox {
  String user;
  Order order;
  int msgtype;
  bool isRead = false;
  String message = '';
  bool isEnd = false;
  NotificationBox({required this.user, required this.order, required this.msgtype});

  void setMessage(){
    if(msgtype == 0){
      message = '${order.tcode} has been rejected.';
    }else if(msgtype == 1){
      message = '${order.tcode} has now been confirmed.\nRequest for delivery status: PENDING';
    }else if(msgtype == 2){
      message = '${order.tcode} has now been approved.\nDelivery status: ON THE WAY';
    }else if(msgtype == 3){
      message = '${order.tcode} has now been delivered.\nDelivery status: DELIVERED';
    }else if(msgtype == 4){
      message = 'WARNING: WAREHOUSE CAPACITY UNDERLOAD';
    }
  }

  void readNotif(){
    isRead = true;
  }
}