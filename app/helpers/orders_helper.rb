module OrdersHelper
  def show_order_courier_status(status)
    case status
    when 'new'
      '物流取派单'
    end
  end
end
