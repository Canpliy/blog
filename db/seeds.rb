# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

title = '活着，真是对不起'
content = '<p>注：“活着，真是对不起”源于《被遗弃松子的一生》这部电影一句话，而这篇随笔有点类似影评。</p>
    <p>如果用一句话简述这部电影，我会用一位豆友的一句话——“这不是一部爱情电影，尽管整部电影都是松子的恋爱史。”</p>
    <p>整部影片讲的是一个很悲伤、很现实的故事，但影片的表现手法却超乎寻常。整个影片很轻松，然后还有很多的搞笑情节。但是，看完之后很不轻松，仿佛有一个面无表情的人，从容不迫的将她身上的伤疤活深深的撕扯开，鲜血不停的流淌，而她依旧面部表情。</p>'

Article.create(title: title, content: content)
