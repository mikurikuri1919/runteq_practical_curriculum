require "rails_helper"

RSpec.describe "admin_tags_breadcrumbs", type: :system do
  let(:user) { create(:user, :admin) }
  # let(:tag) { create(:tag) }

  before do
    login(user)
  end

  context 'タグ一覧画面にアクセス' do
    example 'パンくずリストが表示される' do
      visit admin_tags_path
      expect(page).to have_selector('.breadcrumb', text: 'Home')
      expect(page).to have_selector('.breadcrumb', text: 'タグ')
    end
  end

  context 'タグ編集画面にアクセス' do
    let!(:tag) { create :tag }
    example 'パンくずリストが表示される' do
      visit edit_admin_tag_path(tag)
      expect(page).to have_selector('.breadcrumb', text: 'Home')
      expect(page).to have_selector('.breadcrumb', text: 'タグ')
      expect(page).to have_selector('.breadcrumb', text: 'タグ編集')
    end
  end
end

