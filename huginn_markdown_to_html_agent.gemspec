# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "huginn_markdown_to_html_agent"
  spec.version       = '1.0'
  spec.authors       = ["Paul"]
  spec.email         = ["git@paul.sx"]

  spec.summary       = %q{Convert Markdown to HTML for Huginn}
  spec.description   = %q{Agent that converts Markdown formatted text to HTML}

  spec.homepage      = "https://github.com/paul-sx/huginn_markdown_to_html_agent"

  spec.license       = "MIT"

  spec.files         = Dir['LICENSE.txt', 'lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir['spec/**/*.rb']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 2.1.0"
  spec.add_development_dependency "rake", "~> 12.3.3"

  spec.add_runtime_dependency "huginn_agent"
end
