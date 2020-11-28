require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  setup do
    @category = categories(:one)
  end
  
  test 'should not save when invalid params are sent' do

    #  uniqueness and presence test for name
    #  when completed?
    #  when started?

    # task = Task.new
    task = tasks(:default)
    assert_not task.save

    # byebug
  end

  test 'should receive an error message for name when invalid params are sent' do
    task = Task.new
    assert_not task.save

    assert task.errors.full_messages.include? "Name can't be blank"
  end

  test 'should receive an error message for Category when invalid params are sent' do
    # task = Task.new
    task = tasks(:default)
    assert_not task.save

    assert task.errors.full_messages.include? "Category must exist"
  end

  test 'should receive an error message for name when name is taken' do
    task = Task.new(name: 'task name', category_id: @category.id)
    assert_not task.save
  end

  test 'should return true if the task is completed' do
    completed_task = tasks(:completed)
    assert completed_task.completed?
  end

  test 'should return true if the task is started' do
    started_task = tasks(:started)
    assert started_task.started?
  end
end
