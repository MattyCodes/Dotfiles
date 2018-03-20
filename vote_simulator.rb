require 'rubygems'
require 'mechanize'
require 'byebug'

USER_AGENTS = [
  "Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko",
  "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36 OPR/42.0.2393.94",
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36",
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36",
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.1.25 (KHTML, like Gecko) Version/8.0 Safari/600.1.25",
  "Mozilla/5.0 (Linux; U; Android 2.2) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1",
  "Mozilla/5.0 (iPhone; CPU iPhone OS 11_0_3 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) CriOS/65.0.3325.112 Mobile/15A432 Safari/604.1",
  "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1",
  "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:56.0) Gecko/20100101 Firefox/D839",
  "Mozilla/5.0 (Windows NT 6.1; rv:28.0) Gecko/20100101 Firefox/28.0",
  "Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36)",
  "Mozilla/5.0 (X11; Linux i686; rv:21.0) Gecko/20100101 Firefox/21.0",
  "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5330 (KHTML, like Gecko) Chrome/40.0.890.0 Mobile Safari/5330",
  "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0",
  "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/49.0.2623.108 Chrome/49.0.2623.108 Safari/537.36"
]

AGENT_ALIASES = [
  "Linux Mozilla",
  "Mac Mozilla",
  "Mac Safari 4"
]

module HeadlessConnection
  class VotingService
    def run_script
      agent_name  = USER_AGENTS.sample
      agent_alias = AGENT_ALIASES.sample
      driver = Mechanize.new { |agent|
        agent.user_agent_alias = agent_alias
      }

      driver.user_agent = agent_name
      driver.get('http://www.gwinnettprepsports.com/schools/lanier/fans-choice-spring-athlete-of-the-week-candidate-profiles/article_2a32e578-2b2b-11e8-8290-73d2bc868286.html') do |page|
        puts "Page found."
        sleep rand(5..10)
        form   = page.form_with(:id => "poll-b2b1ccf4-2b29-11e8-9ae0-4f05da350c50-form")
        button = form.button_with(:type => "submit")
        radio  = form.radiobutton_with(:value => "C7EA24D5-9340-0001-BDF44A003A604440")
        puts "Form / buttons found."
        radio.check
        puts "Radio button selected."
        sleep rand(1..10)
        driver.submit(form, button)
        puts "Form submitted."
      end
    end
  end
end

t = HeadlessConnection::VotingService.new
t.run_script
