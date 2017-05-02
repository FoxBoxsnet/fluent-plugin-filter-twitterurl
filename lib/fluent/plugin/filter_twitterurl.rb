

module Fluent
  class TwitterUrl < Filter
    Plugin.register_filter('twitterurl', self)

     config_param :key_screen_name,  :string, :default => 'user_screen_name'
     config_param :key_twitter_id,   :string, :default => 'id'
     config_param :key_postfix,      :string, :default => 'twitter_url'
     config_param :remove_prefix,    :string, :default => nil
     config_param :add_prefix,       :string, :default => nil


    def configure(conf)
      super
      @remove_prefix = Regexp.new("^#{Regexp.escape(remove_prefix)}\.?") unless conf['remove_prefix'].nil?
    end

    def filter_stream(tag, es)
      new_es = MultiEventStream.new
      tag = tag.sub(@remove_prefix, '') if @remove_prefix
      tag = (@add_prefix + '.' + tag) if @add_prefix

      es.each do |time,record|
         urls = ["https://twitter.com/", record[@key_screen_name] , "/status/" , record[@key_twitter_id]]
         record[@key_postfix] = urls.join rescue nil
        new_es.add(time, record)
      end
      return new_es
    end
  end
end