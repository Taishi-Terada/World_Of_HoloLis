# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 Admin.create!(
   email: 'test@test',## 任意のメールアドレス,
   password: 'test1234' ## 任意のパスワード
 )

 olivia = Customer.find_or_create_by!(email: "olivia@example.com") do |customer|
   customer.name = "Olivia"
   customer.password = "password"
   customer.introduction = "よろしく"
   customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer1.jpg"), filename:"sample-customer1.jpg")
   customer.is_deleted = false
 end

 james = Customer.find_or_create_by!(email: "james@example.com") do |customer|
   customer.name = "James"
   customer.password = "password"
   customer.introduction = "仲良くしてください"
   customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer2.jpg"), filename:"sample-customer2.jpg")
   customer.is_deleted = false
 end

 lucas = Customer.find_or_create_by!(email: "lucas@example.com") do |customer|
   customer.name = "lucas"
   customer.password = "password"
   customer.introduction = "同担の方、友達になりましょう。"
   customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer3.jpg"), filename:"sample-customer3.jpg")
   customer.is_deleted = false
 end


 ma_community = VtuberCommunity.create
 minato_aqua = VtuberInformation.create(vtuber_name: "湊あくあ") do |vtuber_information|
   vtuber_information.youtube_name = "Aqua Ch.湊あくあ"
   vtuber_information.twitter_name = "@minatoaqua"
   vtuber_information.tag_name = "＃湊あくあ生放送"
   vtuber_information.fan_name = "あくあクルー"
   vtuber_information.mark = "⚓"
   vtuber_information.color = "ピンク"
   vtuber_information.height = "148㎝"
   vtuber_information.blood_type = "B型"
   vtuber_information.birthday = "2023-12-01"
   vtuber_information.first_delivery = "2018-08-08"
   vtuber_information.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-vtuber_information1.jpg"), filename:"sample-vtuber_information1.jpg")
   vtuber_information.vtuber_community = ma_community
 end
 
 tt_community = VtuberCommunity.create
 tokoyami_towa = VtuberInformation.create(vtuber_name: "常闇トワ") do |vtuber_information|
   vtuber_information.youtube_name = "Towa Ch.常闇トワ"
   vtuber_information.twitter_name = "@tokoyamitowa"
   vtuber_information.tag_name = "＃トワイライブ"
   vtuber_information.fan_name = "常闇眷属"
   vtuber_information.mark = "👾"
   vtuber_information.color = "紫"
   vtuber_information.height = "150㎝"
   vtuber_information.blood_type = "?"
   vtuber_information.birthday = "2023-08-08"
   vtuber_information.first_delivery = "2020-01-03"
   vtuber_information.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-vtuber_information2.jpg"), filename:"sample-vtuber_information2.jpg")
   vtuber_information.vtuber_community = tt_community
 end
 
 hs_community = VtuberCommunity.create
 hosimati_suisei = VtuberInformation.create(vtuber_name: "星街すいせい") do |vtuber_information|
   vtuber_information.youtube_name = "Suisei Channel"
   vtuber_information.twitter_name = "@suisei_hosimati"
   vtuber_information.tag_name = "＃ほしまちすたじお"
   vtuber_information.fan_name = "星詠み"
   vtuber_information.mark = "☄️"
   vtuber_information.color = "青"
   vtuber_information.height = "160㎝"
   vtuber_information.blood_type = "A型"
   vtuber_information.birthday = "2023-03-22"
   vtuber_information.first_delivery = "2018-03-22"
   vtuber_information.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-vtuber_information3.jpg"), filename:"sample-vtuber_information3.jpg")
   vtuber_information.vtuber_community = hs_community
 end

 VtuberInformation.find_or_create_by!(vtuber_name: "星街すいせい") do |vtuber_information|
 end

 post1 = Post.find_or_create_by!(introduction: "かわいい") do |post|
   post.vtuber_community_id = minato_aqua.vtuber_community.id
   post.customer_id = olivia.id
   post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
   post.category = "＃湊あくあ生放送"
 end

 post2 = Post.find_or_create_by!(introduction: "トワ様まじ天使") do |post|
   post.vtuber_community_id = tokoyami_towa.vtuber_community.id
   post.customer_id = james.id
   post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
   post.category = "＃トワイライブ"
 end

 post3 = Post.find_or_create_by!(introduction: "すいちゃんは今日も??") do |post|
   post.vtuber_community_id = hosimati_suisei.vtuber_community.id
   post.customer_id = lucas.id
   post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
   post.category = "＃ほしまちすたじお"
 end

 News.find_or_create_by!(news_introduction: "常闇トワ1stソロライブグッズ") do |news|
   news.news_name = "hololive(グッズ)"
   news.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-news1.jpg"), filename:"sample-news1.jpg")
 end

 News.find_or_create_by!(news_introduction: "にじぱぺっとシリーズvol.7") do |news|
   news.news_name = "にじさんじ(グッズ)"
   news.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-news2.jpg"), filename:"sample-news2.jpg")
 end

 News.find_or_create_by!(news_introduction: "ぶいすぽっ！文化体育祭") do |news|
   news.news_name = "ぶいすぽっ！(イベント)"
   news.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-news3.jpg"), filename:"sample-news3.jpg")
 end

 PostComment.find_or_create_by!(comment: "かわいいすぎます") do |post_comment|
   post_comment.customer_id = james.id
   post_comment.post_id = post1.id
 end

 PostComment.find_or_create_by!(comment: "TMT!!") do |post_comment|
   post_comment.customer_id = lucas.id
   post_comment.post_id = post2.id
 end

 PostComment.find_or_create_by!(comment: "かわいい～") do |post_comment|
   post_comment.customer_id = olivia.id
   post_comment.post_id = post3.id
 end