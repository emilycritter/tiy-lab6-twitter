# users
if User.count == 0

  user = User.new
  user.name = "hellokitty"
  user.email = "#{user.name}@example.com"
  user.password = "12345678"
  user.photo = "https://upload.wikimedia.org/wikipedia/bar/thumb/2/27/Hello_Kitty_logo.svg/2000px-Hello_Kitty_logo.svg.png"
  user.save

  25.times do
    user = User.new
    user.name = "#{Faker::Name.first_name.downcase}lovescats"
    user.email = "#{user.name}@example.com"
    user.password = "12345678"
    user.save
  end

end

cat_meme_urls = [
  "http://data.whicdn.com/images/66960762/original.jpg",
  "https://s-media-cache-ak0.pinimg.com/564x/e0/6c/89/e06c892208d6f8c406dccc61408237ce.jpg",
  "http://vid.alarabiya.net/images/2015/06/13/ec0d5390-eced-42a7-b846-7e88066ac407/ec0d5390-eced-42a7-b846-7e88066ac407_16x9_788x442.jpeg",
  "http://vid.alarabiya.net/images/2015/06/13/ec0d5390-eced-42a7-b846-7e88066ac407/ec0d5390-eced-42a7-b846-7e88066ac407_16x9_788x442.jpeg",
  "https://www.dramafever.com/st/news/images/enhanced-buzz-11546-1375894039-14.jpg",
  "http://33.media.tumblr.com/8d2c9c827a22c38d377ad9badf8433ab/tumblr_inline_n6ehyeooBf1r0srkg.jpg",
  "http://sarajade.com/wp-content/uploads/2013/04/Adorable-kitties-kitties-18082650-670-503.jpg",
  "https://secure.static.tumblr.com/94b31efb375b7201bbb74c389c877c80/ripjayu/brunim9ar/tumblr_static_tumblr_static_filename_640.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiQuHME99-8lCGRifDY9flJRqKb0kkrVr8HS8HqjC7CYRX_8OT",
  "http://images5.fanpop.com/image/photos/29000000/Adorable-Kitties-3-cats-29074285-480-360.jpg",
  "https://i.ytimg.com/vi/kVTZ1gm0BXc/maxresdefault.jpg",
  "https://d2fkddr0p2jbv6.cloudfront.net/render/standard/9208200820420446/6733-heathered_white-z1-t-show-me-your-kitties.png",
  "https://s-media-cache-ak0.pinimg.com/236x/ce/5e/8c/ce5e8c9c8ffdbf62ca39677675e55465.jpg",
  "https://s-media-cache-ak0.pinimg.com/236x/0d/df/68/0ddf682bf080448d9e2682c38e4fb324.jpg",
  "https://s-media-cache-ak0.pinimg.com/236x/23/9a/66/239a665f887d23e32e057dde46a78aff.jpg"
]
# posts
cat_memes = []
cat_memes << "grumpy.jpg"
cat_memes << "loading.jpg"
cat_memes << "cutie.jpg"
cat_memes << "shock.jpg"
cat_memes << "wet.jpg"
cat_memes << "yarn.jpg"
cat_memes << "skateboard.jpg"
cat_memes << "shadow.jpg"
cat_memes << "box.jpg"
cat_memes << "eyes.jpg"
cat_memes << "showme.jpg"
cat_memes << "powers.jpg"
cat_memes << "shutup.jpg"
cat_memes << "hug.jpg"

cat_text = []
cat_text << "I CAN HAS CHEEZBURGER?"
cat_text << "Wake up human for food at 4am stare at ceiling, intently sniff hand, so claws in your leg kitty loves pigs under the bed."
cat_text << "oh hai!!! meowwwwww"
cat_text << "Lick arm hair. Howl uncontrollably for no reason."
cat_text << "Spread kitty litter all over house find empty spot in cupboard and sleep all day yet lick sellotape."
cat_text << "Meowzer! stare at ceiling if it smells like fish eat as much as you wish."
cat_text << "purrrrrrrr-fect"
cat_text << "za catz meoooww"
cat_text << "Drink water out of the faucet find something else more interesting"
cat_text << "purrrrrrr"
cat_text << "you have cat to the kitten me right meow"
cat_text << "Cat-titude is not just “attitude” with “cat” spliced in."
cat_text << "when i'm with you, i'm feline good"
cat_text << "what do you call a pile of cats? a meowtain"
cat_text << "ur purr-fect. i'm not kitten you"
cat_text << "cat puns freak meowt"
cat_text << "ur kinda paw-some"
cat_text << "i hate cat puns. just kitten they're hissterical"
cat_text << "live long and pawspurr"
cat_text << "hello kitty? hello u've got2 be kitten me."
cat_text << "grumpy cat"
10.times do
  cat_text << "meow meowwwww #distraction"
end

if Post.count == 0

  50.times do
    post = Post.new
    post.post_text = cat_text.sample
    post.user_id = User.all.map(&:id).sample
    post.photo = "app/assets/iamges/seeds/posts/#{cat_memes.sample}"
    post.save
  end

  50.times do
    post = Post.new
    post.post_text = cat_text.sample
    post.user_id = User.all.map(&:id).sample
    post.save
  end

end

# follow
100.times do
  followable = User.all.map(&:id).sample
  follower = User.all.map(&:id).sample
  if followable != follower
    following = Follow.where(followable_id: followable, follower_id: follower).first_or_initialize
    following.followable_type = "User"
    following.follower_type = "User"
    following.save
  end
end
