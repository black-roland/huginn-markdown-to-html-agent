require 'rails_helper'
require 'huginn_agent/spec_helper'

describe Agents::MarkdownToHtmlAgent do
  before(:each) do
    @valid_options = Agents::MarkdownToHtmlAgent.new.default_options
    @checker = Agents::MarkdownToHtmlAgent.new(:name => "MarkdownToHtmlAgent", :options => @valid_options)
    @checker.user = users(:bob)
    @checker.save!
  end

  pending "add specs here"
end
