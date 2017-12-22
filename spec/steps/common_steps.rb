module Turnip::Steps
  # GIVEN
  # rubocop:disable Style/SymbolProc
  step ':page page of web application' do |page|
    page.open
  end

  step 'I am on :page page' do |page|
    page.open
  end

  # WHEN
  step 'I click My Blog on :page page' do |page|
    page.on { choose_menu('My Blog') }
  end

  # THEN
  step 'I should be redirected to :page page' do |page|
    expect(page).to be_displayed
  end
end
