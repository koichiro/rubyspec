require File.dirname(__FILE__) + '/../spec_helper'

describe "The || statement" do
  it "evaluates to true if any of its operands are true" do
    if false || true || nil
      x = true
    end
    x.should == true
  end
  
  it "evaluated to false if all of its operands are false" do
    if false || nil
      x = true
    end
    x.should == nil
  end
  
  it "is evaluated before assignment operators" do
    x = nil || true
    x.should == true
  end
  
  it "has a lower precedence than the && operator" do
    x = 1 || false && x = 2
    x.should == 1
  end

  it "treats empty expressions as nil" do
    (() || true).should be_true
    (() || false).should be_false
    (true || ()).should be_true
    (false || ()).should be_nil
    (() || ()).should be_nil
  end
end

describe "The or statement" do
  it "evaluates to true if any of its operands are true" do
    x = nil
    if false or true
      x = true
    end
    x.should == true
  end
  
  it "is evaluated after variables are assigned" do
    x = nil or true
    x.should == nil
  end

  it "has a lower precedence than the || operator" do
    x,y = nil
    x = true || false or y = 1
    y.should == nil
  end

  it "treats empty expressions as nil" do
    (() or true).should be_true
    (() or false).should be_false
    (true or ()).should be_true
    (false or ()).should be_nil
    (() or ()).should be_nil
  end
end
