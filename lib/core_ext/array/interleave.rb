class Array
  # Takes an item from each subarray in order and returns the
  # resulting array. The subarrays do not need to be the same size.
  #
  # The options has takes a 'chunk_size' parameter, which determines
  # how many items are taken from each subarray on each pass.
  def interleave(options = {})
    chunk_size = options.fetch(:chunk_size, 1)

    max_length = map(&:size).max
    output = []
    max_length.times do |i|
      each do |subarray|
        chunk_size.times do |j|
          index = i*chunk_size + j
          output << subarray[index] if index < subarray.length
        end
      end
    end
    output
  end
end
