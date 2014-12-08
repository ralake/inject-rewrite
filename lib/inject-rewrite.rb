class Array

  def my_inject(memo = nil, &block)
    if memo.nil? then memo = self.first
      without_initial_value(memo, &block)
    else
      with_initial_value(memo, &block)
    end
  end

  private

  def without_initial_value(memo, &block)
    self.drop(1).each { |item| memo = block.call(memo, item) }
    memo
  end

  def with_initial_value(memo, &block)
    self.each { |item| memo = block.call(memo, item) }
    memo
  end

end
