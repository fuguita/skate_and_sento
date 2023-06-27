module Public::HomesHelper
  def ranking_position_with_fuffix(n)
    target = n.to_s[-1].to_i
    if target == 1
      "#{n} st"
    elsif target == 2
      "#{n} nd"
    elsif target == 3
      "#{n} rd"
    else
      "#{n} th"
    end
  end
end
