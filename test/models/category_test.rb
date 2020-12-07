require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save category without name" do
    category = Category.new
    assert_not category.save
  end

  test "should save category with valid params" do
    category = Category.create(name: 'new name', description: 'new description')
    assert category.save
  end

  

end
