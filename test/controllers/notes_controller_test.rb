require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @note = notes(:one)
    @note_two = notes(:two)
  end

  test "should get index" do
    get notes_url
    assert_response :success
  end

  test "should get new" do
    get new_note_url
    assert_response :success
  end


  test "should create a note" do
    assert_difference('Note.count') do
      post notes_url, params: {note: {title: "Take out the trash", type_of: 1}}
    end
    assert_redirected_to notes_url
  end

  test "invalid note: title missing" do
    assert_no_difference('Note.count') do
      post notes_url, params: {note: {title: "", type_of: 1}}
    end
    assert_template 'notes/new'
    assert_select '.error-message', 'can\'t be blank'
  end

  test "invalid note: type is incorrect" do
    assert_no_difference('Note.count') do
      post notes_url, params: {note: {title: "Take out the trash", type_of: 3}}
    end
    assert_template 'notes/new'
    assert_select '.error-message', 'choose from the available options'
  end


  test "invalid note: deadline is missing when note type is goal" do
    assert_no_difference('Note.count') do
      post notes_url, params: {note: {title: "Take out the trash", type_of: 2}}
    end
    assert_template 'notes/new'
    assert_select '.error-message', 'Deadline date is invalid.'
  end


  test "invalid note: deadline month is invalid" do
    assert_no_difference('Note.count') do
      post notes_url, params: {note: {title: "Take out the trash", type_of: 2, month: "Jan", day: "20", year: "2018"}}
    end
    assert_template 'notes/new'
    assert_select '.error-message', 'Deadline date is invalid.'
  end

  test "invalid note: deadline day is invalid" do
    assert_no_difference('Note.count') do
      post notes_url, params: {note: {title: "Take out the trash", type_of: 2, month: "1", day: "Monday", year: "2018"}}
    end
    assert_template 'notes/new'
    assert_select '.error-message', 'Deadline date is invalid.'
  end


  test "invalid note: deadline year is invalid" do
    assert_no_difference('Note.count') do
      post notes_url, params: {note: {title: "Take out the trash", type_of: 2, month: "1", day: "Monday", year: "Twenty Eighteen"}}
    end
    assert_template 'notes/new'
    assert_select '.error-message', 'Deadline date is invalid.'
  end


  test "Deadline is showing on page when note type is goal" do
    get edit_note_path(@note_two)
    assert_select '.js-deadline'
  end


  test "should show note" do
    get note_url(@note)
    assert_response :success
  end

  test "should get edit" do
    get edit_note_url(@note)
    assert_response :success
  end


  test "each item in note should get updated" do
    old_note = @note.dup
    patch note_url(@note), params: {note: {title: "Take out the trash", type_of: 2, description: "new description", month: "1", day: "4", year: "2018"}}
    @note.reload
    assert_not_equal old_note.title, @note.title
    assert_not_equal old_note.type_of, @note.type_of
    assert_not_equal old_note.description, @note.description
    assert_not_equal old_note.deadline, @note.deadline
    assert_redirected_to notes_url
  end


  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete note_url(@note)
    end

    assert_redirected_to notes_url
  end

end
