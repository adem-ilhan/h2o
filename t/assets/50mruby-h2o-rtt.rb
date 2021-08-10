Proc.new do |env|
  rtt = nil
  unless env["h2o.get_rtt_estimate"].nil?
    rtt = env["h2o.get_rtt_estimate"].call()
    while rtt.nil? do
      sleep(0.1)
      rtt = env["h2o.get_rtt_estimate"].call()
    end
  end
  if rtt.nil?
    rtt = 'N/A'
  end
  [200, {}, ["RTT = ", rtt]]
end
