namespace :article_state do
  desc '公開待ちの中で、公開日時が過去になっているものがあれば、ステータスを「公開」に変更されるようにする'             # desc で処理の説明文を記入する
  task change_to_be_published: :environment do # taskの名前を付ける。 environmentはDBへアクセスする場合に追記する。今回だとstateカラムの中身が変わるので必要。
    Article.publish_wait.past_published.find_each(&:published!)
  end
end