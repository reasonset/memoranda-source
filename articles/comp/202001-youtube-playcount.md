---
title: YouTubeの再生数と再生時間
date: 2020-01-01
category: サービスとプラットフォーム
---

# 序

この記事は、声優の飴川紫乃さんとナオト†サンクチュアリさんがパーソナリティを務めるYouTubeの[せいきゃんch](https://www.youtube.com/channel/UCRxICnR_FcAci2tnRpNcJsg){rel="external"}における要望に応えたものである。
(チャンネルいくらか、性的にセンシティブな要素があるので、神経質な方はご注意願いたい)

この記事はコンピュータに関する話題であるが、ChienomiではなくMemorandaにて公開する理由は、単純にこの記事の内容は *明確なエビデンスがないから* である。

ある程度の検証はしているが、内容は保証できないので、その旨了解の上読み進めていただきたい。

また、コンピュータに関するちゃんとエビデンスのある記事を読みたい人は[Chienomi](https://chienomi.org/){rel="external"}を楽しんでいただけたら幸いである。

また、あまり不確かなことをブログで書けないという意味も含めて、知人に話す場合などは検証時のデータなども踏まえてもっと詳細に説明するのだが、ここではざっくりとしか書けないということもご了承いただきたい。

また、ここはChienomiではないので、比較的初歩的なことも解説が入るので、その点もご了承いただきたい。

# 前提

YouTubeが再生数、及び再生時間をカウントする方法は公開されていない。

そして前提として、単純に「再生すればカウントされるわけではない」というものである。
私が試した限りでは、動画をLINEで共有して、相手がそれを開いて再生した場合、再生にカウントされない。

ただし、外形的には同じに見える再生であっても再生にカウントされたりされなかったりする。
また、単純に機械的に再生した場合、カウントされないことを把握している。

つまり、YouTubeはあるアルゴリズムにおいて再生がオーガニックなもの(人間的かつ対話的な再生であること)であることを判定しているのである。

また、可能な限り同条件を再現するようにしても、期間を置いたアクセスにおいてカウントされたりされなかったりするため、アルゴリズムは変更されているだけでなく、学習的な(流行り風に言うならAIによる)ものであると確認されている。

# オーガニック

まず「オーガニックなアクセスとはなにか?」である。

例えば、HTTP(S)でYouTubeのストリームを取得し、視聴するという方法がある。
VLC Media Playerなどにはこの機能が搭載されている。

しかし、この方法での再生は再生回数、再生時間にはカウントされない。
「ストリームの取得」をカウントしてしまうと、機械的に(プログラムで)ストリームを取得することで再生数を水増しできてしまうからだ。
当然だが、YouTube(Google)側から見たときに、「YouTubeのストリームを取得される」のはわかるが、取得されたあとどのようにされるかというのは知る方法がない。例えば、単にデータを取得して保存しているのか、再生目的じゃないソフトウェアで処理しているのか、あるいは再生して見ているのか、ということだ。
このことから、ストリームを取得されることはカウントしない。

そして、オーガニックなアクセスを判断する上で、プラス方向に振れるか、マイナス方向に振れるか、という問題がある。

例えば、ブラウザ上でYouTubeの動画をリピート再生してBGM/BGVとしている場合、実際にそれを見ている可能性もある。
一方、単に放置している可能性もあるわけだ。
この状況においてオーガニックであるかどうか判断する条件に乏しい。ここで「オーガニックである可能性があるならオーガニックである」という考え方と、「オーガニックでないと思われるならオーガニックではない」という考え方がある。
これについては条件は結構厳しく、単に再生しただけでは算入されない、というレベルである。

つまり、YouTubeとしては、放置やスクリプトのような単純なものだけでなく、オートメーションに関しても排除する方向であり、実際の視聴回数や視聴時間よりも常に大きく下ぶれするということを意味する。

ではどのような条件でオーガニックとみなされるのか。

非常に大きな要素であるのは「Googleアカウント」である。

Googleアカウントでログインしていない状態でのYouTube視聴は、Googleアカウントでログインした状態で視聴するのと比べ非常にカウントされにくい。というか、ほとんどカウントされない。

また、バックグラウンド再生もカウントされない。
これは、少なくともGoogle Chromeであれば、他にタブを開いて、他のタブをアクティブにしている状態だとカウントされない。

詳細な条件を出すのは難しいが、「フルスクリーンであるかどうか」「その視聴中にブラウザにマウスイベントが発生したかどうか」(ブラウザ上でマウスを動かしたりしたかどうか)「再生操作を行ったかどうか」などが影響しそうであるし、試した限りでは明確ではないがどうも関係はしていそうだ、という感じであった。

# 視聴時間と視聴回数の関係

[はるかみ☆でぃじっとで出している、Chienomiの記事と連動した動画](https://youtu.be/z_ZR8LMpEeY){rel="external"}の例だが、この動画は

* 動画時間 17分30秒
* 総再生時間 0.7時間
* 平均視聴時間 2分4秒
* 視聴回数 21

である。
さて、では`124 * 21`はいくつか?というと、`2604`である。つまり、43.4分であり、43.4/60は0.723333…であることから、およそ0.7時間というのと整合する。

このことから、「カウントされないケースでは全面的にrevokeされ、再生数にも入らない」ということがわかる。
わずかであっても再生時間にカウントされるのであれば、再生数にもカウントされる。
そして、例えばリピート再生したときに、2回目の再生は「再生数も増えて時間も増える」か「再生数も時間もカウントされない」かどちらかであるということだ。

そして、これは「基本的にはカウントされない」。再生時間はあるユーザーがある時間の動画を見たかどうかを判定するものであり、例えば巻き戻しをして再生しても重複するシーンがカウントされることはない。
そして、リピート再生は巻き戻しと同じ扱いになるのである。

ところが、「もう一度見る」でみた場合はカウントされることもあるように見える。
確かめようとしたが再現できなかったので、そうだとは言い切れないのだが。

ただ、これは「同じ人が繰り返しみても意味がない」という意味ではない。動画が繰り返し見られればそれは普通に再生数が伸びる。

また、動画をスキップした場合は全動画中の実際に再生された時間の割合で再生時間はカウントされる。
だから、スキップされると再生時間は動画の総時間に対しては減るが、ちゃんとカウントはされる。

なお、このデータは「動画の再生時間」であり、ライブは含まない。
総再生時間はチャンネルの価値として換算されるため、ずっとライブを流し続けることで再生時間を稼ぐことができてしまうためだ。

さらに、アーカイブも含まれない。
このことはこれまで明瞭ではなかったが、YouTube Studioのバージョンアップにより、「アップロード動画」と「ライブ配信」が分離され、含まれないことが明瞭になった。(ちなみに、アーカイブは「ライブ再配信」という名称となり、ライブ動画と同様に扱われることがより明確になった)

また、条件はかなり様々だが、あまりにも早い離脱の場合はカウントされない。

総じて随分と厳しいように見えるが、これ自体は実はユーザーにとっての利益なのか不利益なのかというのは難しい。
なぜならば、このカウントは広告の場合でも有効であり、「広告がみられた=費用が発生する」かどうかの基準でもあるから、広告出稿者にとっては再生カウントが厳しいことは嬉しいことなのだ。

正直なところ、離脱判定はめちゃめちゃ厳しく、神経質になるべきではない。
「あんた、こんとき動画見てへんかったやろ」みたいな考え方をするためだ。

ただ、再生数がカウントされるときには間違いなく再生時間も多かれ少なかれカウントされることになるため、再生数が伸びれば再生時間も必然的に伸びてくる。
露出機会を増やすことを考えると、チャンネル登録者数や高評価数・高評価率が大きく関わってくるが、クリエイターとして呼びかけを行うとすれば、動画を新しくアップロードしたときに見てもらうように呼びかけること、そしてチャンネル登録者など固定ファンを大事にすることだと言えそうだ。
再生時間は実再生時間としては何倍も見てもらわないと伸びないし、再生時間を気にしはじめると、視聴者にこういう環境でこういう形で見るようにといった呼びかけをすることになってしまい、却って視聴者離れを招きかねないし、クリエイターの精神衛生上もよくない。

また、もう少しテクニカルには、適切なジャンル選択やタグ付けなど、動画に付随する情報を正しく選択することが挙げられる。
また、他チャンネルをまたいだ類似性はクオリティが低いとみなされるので、ゆっくりやVOICELOIDなどの音声、またアイコンなどはマイナスに作用することが考えられる。
このあたりのペナルティ感覚は人間的な感覚とかなりかけ離れている。例えば、違法アップロード動画などに対しては著作権上の問題として申し立てられない限り、ひどいものであってもむしろ肯定的に作用するからだ。

なお、*チャンネルの再生数を伸ばすことを求める呼びかけを行うことはNGである*。

あと、もうひとつ盲点になりやすいのは、「アップロードした本人が見てもカウントされる」ということだろうか。

いずれにせよGoogleの胸先三寸なので、あまり気にせず自然にファンが増えるように振る舞っていくのが何よりではないだろうか。 Take it easy.

# ライブ配信

先にライブ配信が別枠であることに言及したが、ではライブ配信したものを動画とアップロードしたらどうなるか。

それは、まずやたらrevokeされやすくなる(このことから、revokeされる条件はアクションだけでなく動画によっても変わるということが分かる)のと、収益化された状態でそれを頻繁にやると「再生数を増やすための行為」とみなされペナルティの対象になる。

ライブ配信を切り貼りしたダイジェスト動画もおおよそ同じ扱いである。

ただし、音声を修正したり、テロップをつけたりといった「リファインされた動画」はこれが緩和される。
このため、ライブ配信して、アーカイブは残さず、リファインした動画をアップロードする、というスタイルは成立するようだ。
(本当にそれだけで大丈夫なのかは疑問だが)

# おまけ: アップロード時の公開について

従来、動画アップロードはアップロード前に状態を選択するようになっていた。
これは、最初の処理が終わった時点でこの状態が適用される。だから、「公開」状態でアップロードすると、最初はSD画質でしか視聴できない状態になる。

ただ、これには明確な問題があった。
動画の概要などの情報がアップロード開始後に記述するものであることから、こうした記述が間に合わず、明らかに「出来上がっていない状態」で公開されることが多々あった。
こうした問題から「公開」オプションが現実的に機能していなかったのだ。

こうしたことがあってか、YouTube Studioを使っている場合、常に非公開になるように変更された。
そして従来のタブ形式からウィザード形式に変更され、第3ステップに公開ステートの変更が入った。
第2ステップは翻訳関係で、処理まで完了してからでないと触ることができない。こうしたことから、原則としては第1ステップを完了した状態で処理が終わるまで待って、第2ステップを進めて第3ステップで公開する、というのが流れになる。

ただし、スキップしてしまうこと自体はできるので、処理が終わる前にステートを公開にしたり、予約することはできる。
「全部の処理が終わったら」という指定はできないので、予約投稿にするのが最も無難だろうか。

ただ、従来と違い、処理がどこまで終わったかは示されるようになった。
といっても、「SD画質の処理完了」「処理完了」の2段階でしかないが。

これは良い変更であり、この仕様で最初にアップロードしたときに一応説明も出るのだが、よりややこしくなった、というのも否めない。
そして、明らかにこれが最善ではない。
