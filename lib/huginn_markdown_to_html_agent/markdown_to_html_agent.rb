module Agents
  class MarkdownToHtmlAgent < Agent
    can_dry_run!
    description <<-MD
      The Markdown to HTML agent takes input in the form of a markdown string and converts it to HTML.

      Use the `source` option (with liquid formatting) to set the markdown string you want to convert.
    MD

    def default_options
      {
        'source' => "# Heading\n\nThis is markdown text"
      }
    end

    def working?
      true
    end

    def validate_options
      errors.add(:base, 'source is missing') unless options['source'].present?
    end

    def check
      markdown_input = interpolated["source"]
      output = Kramdown::Document.new(markdown_input, auto_ids: false).to_html
      create_event payload: {'html' => output}
    end

    def receive(incoming_events)
      interpolate_with_each(incoming_events) do |event|
        markdown_input = interpolated["source"]
        output = Kramdown::Document.new(markdown_input, auto_ids: false).to_html
        create_event payload: event.payload.merge({'html' => output})
      end
    end
  end
end
