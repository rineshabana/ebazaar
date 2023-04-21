module InventoriesHelper
  def time_zone_converter(time)
    time.in_time_zone(current_user.time_zone).strftime('%d-%m-%Y %I:%M:%S %p')
  rescue StandardError
    time.strftime('%d-%m-%Y %I:%M:%S %p')
  end
end
