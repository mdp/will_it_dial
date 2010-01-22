require 'spec'
require "lib/will_it_dial"

describe "A paranoid phone validator" do

  
  it "should return true for valid numbers" do
    WillItDial::US.check('404-514-6858').should be_true
    WillItDial::US.check('1-404-514-6858').should be_true
  end
  
  it "should return false for suspicious numbers" do
    WillItDial::US.check('404-404-0404').should be_false # Suspicious, only 2 unique digits
    WillItDial::US.check('404-555-5555').should be_false # Suspcious
    WillItDial::US.check('404-444-4449').should be_false # Suspcious, 7 same digits in a row
    WillItDial::US.check('404-444-4489').should be_true # Suspcious but somewhat believable
  end
  
  it "should return false for invalid numbers" do
    WillItDial::US.check('404-154-7372').should be_false # Can't start exchange code with 1
    WillItDial::US.check('404-054-7372').should be_false # Can't start exchange code with 0
    WillItDial::US.check('404-311-7372').should be_false # Can't have x11 exchange codes
  end
  
  it "should return false for banned numbers" do
    WillItDial::US.check('404-555-1212').should be_false # Explicitly banned
  end
  
  it "should default to US when called generically" do
    WillItDial('404-555-1212').should be_false
    WillItDial('404-514-6858').should be_true
  end
  
end