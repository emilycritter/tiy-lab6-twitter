# users
if User.count == 0

  user = User.new
  user.name = "hellokitty"
  user.email = "#{user.name}@example.com"
  user.password = "12345678"
  File.open("#{Rails.root}/app/assets/images/seeds/Hello_Kitty.jpg", "rb") do |file|
    user.photo = file
  end
  user.save

  25.times do
    user = User.new
    user.name = "#{Faker::Name.first_name.downcase}lovescats"
    user.email = "#{user.name}@example.com"
    user.password = "12345678"
    user.save
  end

end

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
7.times do
  cat_text << "meow meowwwww #distraction"
end

if Post.count == 0

  75.times do
    post = Post.new
    post.post_text = cat_text.sample
    post.user_id = User.all.map(&:id).sample
    File.open("#{Rails.root}/app/assets/images/seeds/posts/#{cat_memes.sample}", "rb") do |file|
      post.photo = file
    end
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
