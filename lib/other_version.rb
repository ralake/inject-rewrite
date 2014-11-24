class Array

  def my_inject(memo = nil, &block)
    if memo.nil? then memo_nil(memo, &block)
    else
      memo_not_nil(memo, &block)
    end
  end

  
  def memo_nil(memo, &block)
    accumulator = Proc.new { |item| memo = block.call(memo, item) }
    memo = self.first
    self.drop(1).each &accumulator
    memo
  end

  def memo_not_nil(memo, &block)
    accumulator = Proc.new { |item| memo = block.call(memo, item) }
    self.each &accumulator
    memo
  end

end