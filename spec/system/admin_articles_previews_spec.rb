require "rails_helper"

RSpec.describe "admin_articles_previews", type: :system do
  let(:user) { create(:user, :admin) }

  before do
    login(user)
    visit new_admin_article_path
    fill_in 'article[title]', with: 'test'
    fill_in 'article[slug]', with: 'test'
    fill_in 'article[description]', with: 'test'
    click_button '登録する'
    click_link 'ブロックを追加する'
  end

  describe '記事作成画面で画像ブロックを追加' do
    context '文章ブロックを選択してプレビューする場合' do
      it 'エラーが発生しない' do
        click_link '文章'
        click_link 'プレビュー'
        expect(page).not_to have_content("no implicit conversion of nil into String"), 'エラーページが表示されています'
        expect(page).to have_content('test'), 'プレビューページが正しく表示されていません'
      end
    end

    context '画像ブロックを選択してプレビューする場合' do
      it 'エラーが発生しない' do
        click_link '画像'
        click_link 'プレビュー'
        expect(page).not_to have_content("Nil location provided. Can't build URI"), 'エラーページが表示されています'
        expect(page).to have_content('test'), 'プレビューページが正しく表示されていません'
      end
    end
  end
end
