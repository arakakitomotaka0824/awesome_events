require "application_system_test_case"

class WelcomesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit welcomes_url
  #
  #   assert_selector "h1", text: "Welcome"
  # end

  test "/ ページの表示" do
    visit root_url
    assert_selector "h1",  text: "イベント一覧"
  end
end
