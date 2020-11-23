module SignInSupport
  def sign_in(user)
    fill_in 'nickname', with: @user.nickname
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    fill_in 'password-confirmation', with: @user.password_confirmation
    fill_in 'last-name', with: @user.last_name
    fill_in 'first-name', with: @user.first_name
    fill_in 'last-name-kana', with: @user.last_name_kana
    fill_in 'first-name-kana', with: @user.first_name_kana
    select '1930', from: 'user[birth_date(1i)]'
    select '12', from: 'user[birth_date(2i)]'
    select '12', from: 'user[birth_date(3i)]'
    click_button '会員登録'
  end
end