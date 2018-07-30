require "application_system_test_case"

class FormulationsTest < ApplicationSystemTestCase
  setup do
    @formulation = formulations(:one)
  end

  test "visiting the index" do
    visit formulations_url
    assert_selector "h1", text: "Formulations"
  end

  test "creating a Formulation" do
    visit formulations_url
    click_on "New Formulation"

    fill_in "Id", with: @formulation.id
    fill_in "Name", with: @formulation.name
    click_on "Create Formulation"

    assert_text "Formulation was successfully created"
    click_on "Back"
  end

  test "updating a Formulation" do
    visit formulations_url
    click_on "Edit", match: :first

    fill_in "Id", with: @formulation.id
    fill_in "Name", with: @formulation.name
    click_on "Update Formulation"

    assert_text "Formulation was successfully updated"
    click_on "Back"
  end

  test "destroying a Formulation" do
    visit formulations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Formulation was successfully destroyed"
  end
end
