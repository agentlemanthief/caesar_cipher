require './lib/caesar_cipher'

describe '#caesar_cipher' do
  it 'Works with single letters' do
    expect(caesar_cipher('a', 1)).to eql('b')
  end
  it 'Works with words' do
    expect(caesar_cipher('Aaa', 1)).to eql('Bbb')
  end
  it 'Works with phrases' do
    expect(caesar_cipher('Hello, World!', 5)).to eql('Mjqqt, Btwqi!')
  end
  it 'Works with negative shift' do
    expect(caesar_cipher('Mjqqt, Btwqi!', -5)).to eql('Hello, World!')
  end
  it 'Wraps when shift pushes letter passed end of alphabet' do
    expect(caesar_cipher('Z', 1)).to eql('A')
  end
  it 'Works with large positive shift values' do
    expect(caesar_cipher('Hello, World!', 75)).to eql('Ebiil, Tloia!')
  end
  it 'Works with large negative shift values' do
    expect(caesar_cipher('Hello, World!', -29)).to eql('Ebiil, Tloia!')
  end
end
