require './lib/inject-rewrite'

a = [5, 6, 7, 8, 9, 10]
b = ["Makers", "Academy"]

def longest_my_inject
  longest = %w{ cat sheep bear }.my_inject do |memo, word|
    memo.length > word.length ? memo : word
  end
end

def longest_real_inject
  longest = %w{ cat sheep bear }.inject do |memo, word|
    memo.length > word.length ? memo : word
  end
end

describe 'Array' do 

# Tests are taken from ruby docs

  it 'can find the longest word' do
    expect(longest_my_inject).to eq(longest_real_inject)
  end

  it 'can sum some numbers' do
    expect(a.my_inject(&:+)).to eq(a.inject(:+))
  end

  it 'can sum some numbers with a starting value' do
    expect(a.my_inject(3, &:+)).to eq(a.inject(3, :+))
  end

  it 'can multiplay some numbers' do
    expect(a.my_inject(&:*)).to eq(a.inject(:*))
  end

  it 'can divide some numbers' do
    expect(a.my_inject(&:/)).to eq(a.inject(:/))
  end

  it 'can concatenate strings' do
    expect(b.my_inject(&:+)).to eq(b.inject(:+))
  end

end
