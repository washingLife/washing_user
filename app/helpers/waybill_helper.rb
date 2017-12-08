module WaybillHelper
  def show_waybill_status(status)
    case status
    when 'new'
      '初始'
    end
  end
end
