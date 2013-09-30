default[:td_agent][:api_key] = ''
default[:td_agent][:version] = nil

default[:td_agent][:plugins] = []
default[:td_agent][:config] = [
  [{:key => 'match', :value => 'td.*.*' }, {
    :type => 'tdlog',
    :apikey => node[:td_agent][:api_key],
    :auto_create_table => nil,
    :buffer_type => 'file',
    :buffer_path => '/var/log/td-agent/buffer/td'
  }],
  [{:key => 'match', :value => 'debug.**'}, {
    :type => 'stdout'
  }],
  [{:key => 'source', :value => nil}, {
    :type => 'forward',
    :port => 24224
  }],
  [{:key => 'source', :value => nil}, {
    :type => 'http',
    :port => 8888
  }],
  [{:key => 'source', :value => nil}, {
    :type => 'debug_agent',
    :bind => '127.0.0.1',
    :port => 24230
  }]
]
