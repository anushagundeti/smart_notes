require "application_system_test_case"

class SummariesTest < ApplicationSystemTestCase
  setup do
    @summary = summaries(:one)
  end

  test "visiting the index" do
    visit summaries_url
    assert_selector "h1", text: "Summaries"
  end

  test "should create summary" do
    visit summaries_url
    click_on "New summary"

    fill_in "Original text", with: @summary.original_text
    fill_in "Summary", with: @summary.summary
    fill_in "Title", with: @summary.title
    fill_in "User", with: @summary.user_id
    click_on "Create Summary"

    assert_text "Summary was successfully created"
    click_on "Back"
  end

  test "should update Summary" do
    visit summary_url(@summary)
    click_on "Edit this summary", match: :first

    fill_in "Original text", with: @summary.original_text
    fill_in "Summary", with: @summary.summary
    fill_in "Title", with: @summary.title
    fill_in "User", with: @summary.user_id
    click_on "Update Summary"

    assert_text "Summary was successfully updated"
    click_on "Back"
  end

  test "should destroy Summary" do
    visit summary_url(@summary)
    click_on "Destroy this summary", match: :first

    assert_text "Summary was successfully destroyed"
  end
end
