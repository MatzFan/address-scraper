class Parser

  def initialize
  end

  def parse(address_string)
    add_array = address_string.split(', ')
    num_lines = add_array.size
    postcode = add_array.last
    parish = add_array[num_lines -3]
    road = add_array[num_lines -4]
    lines1to4 = add_array[0..num_lines -5].join(", ")
    lines1to4 + '|' + road + '|' + parish + '|' + postcode
  end

end
