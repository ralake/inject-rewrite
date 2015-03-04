require './lib/recursive_inject'

def longest_my_inject
  longest = %w{ cat sheep bear }.recursive_inject do |memo, word|
    memo.length > word.length ? memo : word
  end
end

def longest_real_inject
  longest = %w{ cat sheep bear }.inject do |memo, word|
    memo.length > word.length ? memo : word
  end
end

describe 'Array' do 

  a = [5, 6, 7, 8, 9, 10]
  b = ["Makers", "Academy"]

  it 'can find the longest word' do
    expect(longest_my_inject).to eq(longest_real_inject)
  end

  it 'can sum some numbers' do
    expect(a.recursive_inject(&:+)).to eq(a.inject(:+))
  end

  it 'can sum some numbers with a starting value' do
    expect(a.recursive_inject(3, &:+)).to eq(a.inject(3, :+))
  end

  it 'can multiplay some numbers' do
    expect(a.recursive_inject(&:*)).to eq(a.inject(:*))
  end

  it 'can divide some numbers' do
    expect(a.recursive_inject(&:/)).to eq(a.inject(:/))
  end

  it 'can concatenate strings' do
    expect(b.recursive_inject(&:+)).to eq(b.inject(:+))
  end

end