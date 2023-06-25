require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

Given("User on login page") do
  @driver.navigate.to "https://staging-showcase.adboost.tech/login"
end

Then("User inputs the Email and Password") do
  @driver.find_element(:xpath, '//input[@placeholder = "mail@example.com"]').send_keys 't.e.s.t.mihannod99@gmail.com'
  @driver.find_element(:xpath,'//input[@placeholder = "password"]').send_keys 'hGh^198O]QYd'
  @driver.find_element(:xpath, '//button[@class="button big primary" and text()="Login"]').click
  sleep(2)
end

Then("User press the Login button") do
  @driver.find_element(:xpath, '//button [@class = "button big primary"]').click
end

Then("User on the Deals page") do
  @driver.find_element(:xpath, '//a[@href = "/deals"]').displayed?
end

Then("User inputs the incorrect set of Email and Password") do
  @driver.find_element(:xpath, '//input[@placeholder = "mail@example.com"]').send_keys 't.e.s.t.mihannoasd99@gmail.com'
  @driver.find_element(:xpath,'//input[@placeholder = "password"]').send_keys 'hGh^198Oafafqs]QYd'
end

Then("User see error User credentials do not match") do
  element = @driver.find_element(:xpath, '//div [@class = "error-message"]')
  text = element.text
  required_fragment = "User credentials do not match"
  if text.include?(required_fragment)
    puts "Text contains the required fragment: #{required_fragment}"
  else
    puts "Text does not contain the required fragment: #{required_fragment}"
  end
end
