require './lib/inject-rewrite'

describe 'Array' do 

# Tests are taken from ruby docs

  it 'can find the longest word' do

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

    expect(longest_my_inject).to eq(longest_real_inject)
  end

  it 'can Sum some numbers' do
    a = [5, 6, 7, 8, 9, 10]
    expect(a.my_inject(&:+)).to eq(a.inject(:+))
  end
  
end
