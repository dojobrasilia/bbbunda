describe PeixePuto do

  context 'busca tweets' do
    it 'parseia um tweet' do
      tweet_stream = "abc\r\n"
          
      tweets = buscador.parse_tweets(tweet_stream)
      tweets
    end
  end

end
