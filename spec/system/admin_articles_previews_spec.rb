require "rails_helper"

RSpec.describe "admin_articles_previews", type: :system do
  let(:user) { create(:user, :admin) }
  describe '記事作成画面で画像ブロックを追加' do
    context '画像ファイルをアップロードしない場合' do
      it 'エラーが発生しない' do
        login(user)
        visit new_admin_article_path
        fill_in 'article[title]', with: 'test'
        fill_in 'article[slug]', with: 'test'
        fill_in 'article[description]', with: 'test'
        click_button '登録する'
        click_link 'ブロックを追加する'
        click_link '画像'
        click_link 'プレビュー'
        expect(page).not_to have_content("Nil location provided. Can't build URI"), 'エラーページが表示されています'
        expect(page).to have_content('test'), 'プレビューページが正しく表示されていません'
      end
    end
  end
end

