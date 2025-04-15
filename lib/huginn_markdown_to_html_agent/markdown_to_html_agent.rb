module Agents
  class MarkdownToHtmlAgent < Agent
    default_schedule "never"
    can_dry_run!

    description <<-MD
      The Markdown to HTML agent takes input in the form of a markdown string and converts it to HTML.

      `source` - The markdown text to convert (required, supports Liquid templating)
      `html_key` - The key in the payload where the HTML output will be stored (default: 'html')
    MD

    def default_options
      {
        'source' => "# Heading\n\nThis is markdown text",
        'html_key' => 'html'
      }
    end

    def working?
      true
    end

    def validate_options
      errors.add(:base, 'source is missing') unless options['source'].present?
      errors.add(:base, 'html_key must be a string') unless options['html_key'].is_a?(String)
    end

    def check
      markdown_input = interpolated["source"]
      html_key = interpolated["html_key"] || 'html'
      output = Kramdown::Document.new(markdown_input, auto_ids: false).to_html
      create_event payload: { html_key => output }
    end

    def receive(incoming_events)
      interpolate_with_each(incoming_events) do |event|
        markdown_input = interpolated["source"]
        html_key = interpolated["html_key"] || 'html'
        output = Kramdown::Document.new(markdown_input, auto_ids: false).to_html
        create_event payload: event.payload.merge({ html_key => output })
      end
    end
  end
end
