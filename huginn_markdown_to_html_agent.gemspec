# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "huginn_markdown_to_html_agent"
  spec.version       = '1.0'
  spec.authors       = ["Paul", "Black Roland"]
  spec.email         = ["git@paul.sx", "mail@roland.black"]

  spec.summary       = %q{Huginn agent to convert Markdown to HTML}
  spec.description   = %q{A Huginn agent that converts Markdown formatted text to HTML using Kramdown parser}
  spec.homepage      = "https://github.com/black-roland/huginn-markdown-to-html-agent"
  spec.license       = "MIT"

  spec.files         = Dir['LICENSE.txt', 'README.md', 'lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir['spec/**/*.rb']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 2.1.0"
  spec.add_development_dependency "rake", "~> 12.3.3"

  spec.add_runtime_dependency "huginn_agent"
end
