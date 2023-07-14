require "rails_helper"

RSpec.describe "admin_tags_breadcrumbs", type: :system do
  let(:user) { create(:user, :admin) }

  before do
    login(user)
  end

  describe 'タグ一覧画面' do
    before { visit admin_tags_path }

    it 'パンくずリストが表示される' do
      expect(page).to have_selector('.breadcrumb', text: 'Home')
      expect(page).to have_selector('.breadcrumb', text: 'タグ')
    end

    it '「Home」リンクが機能している' do
      click_link 'Home'
      expect(page).to have_current_path(admin_dashboard_path)
    end
  end

  describe 'タグ編集画面' do
    let!(:tag) { create(:tag) }

    before { visit edit_admin_tag_path(tag) }

    it 'パンくずリストが表示される' do
      expect(page).to have_selector('.breadcrumb', text: 'Home')
      expect(page).to have_selector('.breadcrumb', text: 'タグ')
      expect(page).to have_selector('.breadcrumb', text: 'タグ編集')
    end

    it '「Home」リンクが機能している' do
      visit admin_tags_path
      click_link 'Home'
      expect(page).to have_current_path(admin_dashboard_path)
    end

    it '「タグ」リンクが機能している' do
      visit admin_tags_path
      click_link 'タグ'
      expect(page).to have_current_path(admin_tags_path)
    end
  end
end
