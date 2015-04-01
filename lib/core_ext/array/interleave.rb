class Array
  # Takes an item from each subarray in order and returns the
  # resulting array. The subarrays do not need to be the same size.
  def interleave
    max_length = map(&:size).max
    output = []
    max_length.times do |i|
      each do |subarray|
        index = i
        output << subarray[index] if index < subarray.length
      end
    end
    output
  end
end
