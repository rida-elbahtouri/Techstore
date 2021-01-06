module FeatureTestHelpers
  def do_login(email, password)
    visit new_user_session_path
    fill_in('user_email', with: email)
    fill_in('user_password', with: password)
    click_button('Log in')
  end
end
