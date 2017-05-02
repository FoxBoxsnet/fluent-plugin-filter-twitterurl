require 'strptime'

module Fluent
  class TimestampFilter < Filter
    Plugin.register_filter('timestamp', self)

     config_param :key_time,         :string, :default => 'time'
     config_param :key_format,       :string, :default => '%b %e %H:%M:%S'
     config_param :key_postfix,      :string, :default => 'timestamp'
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
        record[@key_postfix] = Strptime.new(@key_format).exec(@key_time).strftime('%Y-%m-%dT%H:%M:%S%z') rescue nil
        new_es.add(time, record)
      end
      return new_es
    end
  end
end
