module PlacesHelper

  def num_to_day(array)
    day_array = ['月', '火', '水', '木', '金', '土', '日']
    result = []
    array.each do |num|
      result.push(day_array[num.to_i - 1])
    end
    result.join(', ')
  end

  def sym_to_day(symbol)
    case symbol
    when 'mon' then '月'
    when 'tue' then '火'
    when 'wed' then '水'
    when 'thu' then '木'
    when 'fri' then '金'
    when 'sat' then '土'
    when 'sun' then '日'
    end
  end

end
