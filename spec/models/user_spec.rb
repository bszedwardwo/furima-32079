require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規ユーザー登録がうまくいく時' do
      it '全ての項目が埋まっていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが40文字以下なら登録できる' do
        @user.nickname = 'から'
        expect(@user).to be_valid
      end
      it 'passwordが英数混合の6文字以上であれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
    end

    context '新規ユーザー登録がうまくいかない時' do
      it 'nicknameが空だと保存できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複すると保存できない' do
        @user.save
        @another_user = FactoryBot.build(:user)
        @another_user.email = @user.email
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは、@を含まないと保存できない' do
        @user.email = '1a.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと保存できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは、6文字以下だと保存できない' do
        @user.password = '12ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは、半角英数字混合でないと保存できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが一致しないと保存できない' do
        @user.password = '123abc'
        @user.password_confirmation = '123avc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが存在してもpassword_confirmationが空では保存できない' do
        @user.password = '123abc'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと保存できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空だと保存できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameは全角でないと保存できない' do
        @user.last_name = 'daaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameは全角でないと保存できない' do
        @user.first_name = 'daaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_kanaが空だと保存できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空だと保存できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaは全角カナでないと保存できない' do
        @user.last_name_kana = 'あだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kana全角カナでないと保存できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'birth_dateが空だと保存できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end

RSpec.describe 'トップページ', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  it 'ログアウト状態では、ヘッダーに新規登録ボタンが表示されている' do
    # トップページに移動する
    visit root_path
    # トップページに新規登録ボタンがあることを確認する
    expect(page).to have_content('新規登録')
    # ユーザー新規登録画面に遷移する
    click_on '新規登録'
    # 現在のページがユーザー新規登録画面であること
    expect(page).to have_button('会員登録')
  end
  it 'ログアウト状態では、ヘッダーにログインボタンが表示されている' do
    # トップページに移動する
    visit root_path
    # トップページにログインボタンがあることを確認する
    expect(page).to have_content('ログイン')
    # ログインに遷移する
    click_on 'ログイン'
    # 現在のページがログイン画面であることを確認する
    expect(page).to have_button('ログイン')
  end
  it 'ログイン状態では、ヘッダーにユーザーのニックネームボタンが表示されること' do
    # ユーザー新規登録画面に遷移する
    visit new_user_registration_path
    # ユーザー情報を入力する
    sign_in(@user)
    # トップページに移動する
    visit root_path
    # ユーザーのニックネームボタンがあることを確認する
    expect(page).to have_content(@user.nickname.to_s)
  end
  it 'ログイン状態では、ヘッダーにログアウトボタンが表示されること' do
    # ユーザー新規登録画面に遷移する
    visit new_user_registration_path
    # ユーザー情報を入力する
    sign_in(@user)
    # トップページに移動する
    visit root_path
    # ログアウトボタンがあることを確認する
    expect(page).to have_content('ログアウト')
  end
end

RSpec.describe 'サインアウト時の新規出品ページへのアクセス', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  it 'サインイン時は新規出品ページにアクセスできる' do
    # ユーザー新規登録画面に遷移する
    visit new_user_registration_path
    # ユーザー情報を入力する
    sign_in(@user)
    # 新規出品ページに遷移する
    click_on '出品する'
    # 遷移できてることを確認する
    expect(current_path).to eq new_item_path
  end
  it 'サインアウト時は新規出品ページにアクセスするとサインインページに遷移する' do
    # 新規出品ページに遷移する
    visit root_path
    click_on '出品する'
    # サインインページにいることを確認する
    expect(current_path).to eq new_user_session_path
  end
end