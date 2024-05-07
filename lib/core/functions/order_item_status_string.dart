String getOrderItemStatusString(int status) {
  switch (status) {
    case 0:
      return 'Pending';
    case 1:
      return 'Accepted';
    case 2:
      return 'Shipped';
    case 3:
      return 'Delivered';
    default:
      return 'Unknown';
  }
}
