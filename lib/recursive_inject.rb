class Array

  def recursive_inject(memo = nil, array = self, &block)
    if memo.nil?
      memo = array.first
      array = array[1..-1]
    end
    if array.length >= 1
      memo = yield(memo, array[0])
      recursive_inject(memo, array[1..-1], &block)
    else
      return memo
    end
  end

end