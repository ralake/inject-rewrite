class Array

  def my_inject(memo = nil)
    if memo.nil? then memo = self.first
      self.drop(1).each { |item| memo = yield(memo, item) }
      memo
    else
      self.each { |item| memo = yield(memo, item) }
      memo
    end
  end

end
