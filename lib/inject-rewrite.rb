class Array

  def my_inject(memo = nil, &block)
    if memo.nil? then memo = self.first
      memo_is_nil(memo, &block)
    else
      memo_not_nil(memo, &block)
    end
  end

  def memo_is_nil(memo, &block)
    self.drop(1).each { |item| memo = block.call(memo, item) }
    memo
  end

  def memo_not_nil(memo, &block)
    self.each { |item| memo = block.call(memo, item) }
    memo
  end

end
