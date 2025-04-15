# Huginn Markdown to HTML Agent

A Huginn agent that converts Markdown formatted text to HTML using Kramdown parser.

## Installation

Add this string to your Huginn's `.env` `ADDITIONAL_GEMS` configuration:

```ruby
huginn_markdown_to_html_agent(github: black-roland/huginn-markdown-to-html-agent)
```

Then execute:

```bash
bundle
```

## Usage

### Configuration

1. Add the Markdown to HTML Agent to your Huginn scenario
2. Set the `source` option to the markdown content you want to convert (supports Liquid templating)
3. The agent will output events with the HTML content in the `html` field

### Example

Input Markdown:
```markdown
# Heading

This is **bold** text
```

Output HTML:
```html
<h1>Heading</h1>

<p>This is <strong>bold</strong> text</p>
```

## Development

To set up development environment:

```bash
bundle install
```

Running `rake` will clone and set up Huginn in `spec/huginn` to run the specs.

To modify the Huginn repository and branch used for testing, edit the `Rakefile`:

```ruby
HuginnAgent.load_tasks(branch: 'master', remote: 'https://github.com/huginn/huginn.git')
```

After setup, run tests with:

```bash
rake spec
```

To install this gem locally:

```bash
bundle exec rake install
```

## Contributing

1. Fork the project (https://github.com/black-roland/huginn-markdown-to-html-agent/fork)
2. Create your feature branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Create a new Pull Request
