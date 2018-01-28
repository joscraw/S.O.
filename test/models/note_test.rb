require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  def setup
    @note = Note.new(title: "Take out the trash", type_of: 1, description: "test description")
  end

  test "note should be valid" do
    assert @note.valid?
  end

  test "title should be present" do
    @note.title = "     "
    assert_not @note.valid?
  end

  test "deadline should be present" do
    @note.type_of = 2
    assert_not @note.valid?
  end

  test "not should be valid when deadline is present" do
    @note.type_of = 2
    @note.month = "2"
    @note.day = "15"
    @note.year = "2018"
    assert @note.valid?
  end

  test "type must be certain value" do
    @note.type_of = 3
    assert_not @note.valid?
  end

  test "title is too long" do
    @note.title = "a" * 41
    assert_not @note.valid?
  end

  test "description is too long" do
    @note.title = "a" * 1001
    assert_not @note.valid?
  end

  test "deadline format for month is invalid" do
    @note.type_of = 2
    @note.month = "Jan"
    assert_not @note.valid?
  end

  test "deadline format for day is invalid" do
    @note.type_of = 2
    @note.day = "Mon"
    assert_not @note.valid?
  end

end
