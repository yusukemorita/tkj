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

  def show_hours(place)

    #全曜日共通の場合
    if place.hours.present? && place.hours['common_flag'] == true

      string = "<p>#{place.hours['hours']['open']} ~ #{place.hours['hours']['close']}</p>"
      if place.hours['closed_days'].present?
        string += "</div><div class='show_other show-part'>
          <strong>休館日</strong>
          <p>#{num_to_day(place.hours['closed_days'])}</p>"
      end
      string

    #曜日毎に異なる場合
    elsif place.hours.present? && place.hours['common_flag'] == false

      string = "<ul>"
      ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'].each do |symbol|
        if place.hours['hours'][symbol].present?
          string += "<li>#{sym_to_day(symbol)}: #{place.hours['hours'][symbol]['open']} ~ #{place.hours['hours'][symbol]['close']}</li>"
        end
      end
      string += "</ul>"
      string

    #hoursが未登録の場合
    else
      "<p>未登録</p>"
    end

  end

  def show_hours_twitter(place)

    #全曜日共通の場合
    if place.hours.present? && place.hours['common_flag'] == true

      string = "#{place.hours['hours']['open']} ~ #{place.hours['hours']['close']}</p>"
      if place.hours['closed_days'].present?
        string += "休館日： #{num_to_day(place.hours['closed_days'])}"
      end
      string

    #曜日毎に異なる場合
    elsif place.hours.present? && place.hours['common_flag'] == false

      string = "<br><ul>"
      ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'].each do |symbol|
        if place.hours['hours'][symbol].present?
          string += "<li>#{sym_to_day(symbol)}: #{place.hours['hours'][symbol]['open']} ~ #{place.hours['hours'][symbol]['close']}</li>"
        end
      end
      string += "</ul>"
      string

    #hoursが未登録の場合
    else
      "未登録"
    end

  end

end
