require 'base64'
require 'digest'

ROOT = File.expand_path('..', __dir__)

def integrity_for(path)
  digest = Digest::SHA256.digest(File.binread(path))
  "sha256-#{Base64.strict_encode64(digest)}"
end

# Jekyll minifies these files, so the integrity values cover their published bytes.
script_integrities = {
  '/js/gtm.js' => 'sha256-KOs83E8sWN0ZSanqdvyKqXPbanqGOxQAEZPz+lkrVh4=',
  '/js/search.js' => 'sha256-Cn9RZi6b09IrtHxo4SOhpbbX/E5ZK+VAFUrpZMFjghg=',
  '/js/article-navigation.js' => 'sha256-n5SVYPnptA4t2JJaq3b+FC0eYX8KPygyM8jq7/XtIi0=',
  '/js/article-feedback.js' => 'sha256-AlC35S17jo/t3ripYSesMGbb0n4TCpeu1H+vT7O2UnM='
}

config = File.read(File.join(ROOT, 'netlify.toml'))
header_rules = config
  .scan(/\[\[headers\]\](.*?)(?=\n\[\[headers\]\]|\z)/m)
  .flatten
global_header_rules = header_rules.select do |headers|
  headers.match?(/^\s*for\s*=\s*["']\/\*["']\s*$/)
end

unless global_header_rules.one?
  abort 'Netlify must define exactly one global security header rule'
end

global_headers = global_header_rules.first
overriding_policies = (header_rules - global_header_rules).select do |headers|
  headers.match?(/^\s*Content-Security-Policy\s*=/)
end

abort 'Route-specific rules must not override CSP' if overriding_policies.any?

policy = global_headers[/^\s*Content-Security-Policy\s*=\s*"([^"]+)"\s*$/, 1]
abort 'Netlify must set an enforced Content-Security-Policy header' unless policy

directive_entries = policy.split(';').filter_map do |directive|
  name, *sources = directive.split
  [name, sources] if name
end

duplicate_directives = directive_entries
  .map(&:first)
  .tally
  .select { |_name, count| count > 1 }
  .keys

abort "CSP has duplicate directives: #{duplicate_directives.join(', ')}" if duplicate_directives.any?

directives = directive_entries.to_h

expected_directives = {
  'default-src' => ["'self'"],
  'base-uri' => ["'self'"],
  'object-src' => ["'none'"],
  'script-src' => [
    "'self'",
    "'#{script_integrities.fetch('/js/gtm.js')}'",
    "'#{script_integrities.fetch('/js/search.js')}'",
    "'#{script_integrities.fetch('/js/article-navigation.js')}'",
    "'#{script_integrities.fetch('/js/article-feedback.js')}'",
    "'strict-dynamic'",
    'https://www.googletagmanager.com',
    'https://static.hotjar.com',
    'https://script.hotjar.com'
  ],
  'style-src' => [
    "'self'",
    "'unsafe-inline'",
    'https://static.hotjar.com',
    'https://script.hotjar.com'
  ],
  'img-src' => [
    "'self'",
    'https://*.google-analytics.com',
    'https://www.googletagmanager.com',
    'https://*.g.doubleclick.net',
    'https://*.google.com',
    'https://google.com',
    'https://www.google.com.uy',
    'https://www.googleadservices.com',
    'https://pagead2.googlesyndication.com',
    'https://googleads.g.doubleclick.net',
    'https://static.hotjar.com',
    'https://script.hotjar.com',
    'https://survey-images.hotjar.com'
  ],
  'font-src' => [
    "'self'",
    'https://script.hotjar.com'
  ],
  'connect-src' => [
    "'self'",
    'https://*.google-analytics.com',
    'https://*.analytics.google.com',
    'https://www.googletagmanager.com',
    'https://*.g.doubleclick.net',
    'https://*.google.com',
    'https://google.com',
    'https://www.google.com.uy',
    'https://www.googleadservices.com',
    'https://pagead2.googlesyndication.com',
    'https://googleads.g.doubleclick.net',
    'https://ad.doubleclick.net',
    'https://*.hotjar.com',
    'https://*.hotjar.io',
    'wss://*.hotjar.com'
  ],
  'frame-src' => [
    'https://www.googletagmanager.com',
    'https://insights.hotjar.com'
  ],
  'frame-ancestors' => ["'none'"],
  'form-action' => ["'self'"],
  'upgrade-insecure-requests' => []
}

missing_directives = expected_directives.keys - directives.keys
unexpected_directives = directives.keys - expected_directives.keys

abort "CSP is missing directives: #{missing_directives.join(', ')}" if missing_directives.any?
abort "CSP has unexpected directives: #{unexpected_directives.join(', ')}" if unexpected_directives.any?

expected_directives.each do |name, expected_sources|
  actual_sources = directives.fetch(name)
  duplicate_sources = actual_sources.tally.select { |_source, count| count > 1 }.keys
  abort "CSP #{name} has duplicate sources: #{duplicate_sources.join(', ')}" if duplicate_sources.any?

  missing_sources = expected_sources - actual_sources
  unexpected_sources = actual_sources - expected_sources
  abort "CSP #{name} is missing #{missing_sources.join(', ')}" if missing_sources.any?
  abort "CSP #{name} unexpectedly allows #{unexpected_sources.join(', ')}" if unexpected_sources.any?
end

gtm_include = File.read(File.join(ROOT, '_includes', 'gtm_head.html'))
gtm_tag = %(<script src="/js/gtm.js" integrity="#{script_integrities.fetch('/js/gtm.js')}"></script>)
abort 'Google Tag Manager bootstrap or integrity hash is incorrect' unless gtm_include.include?(gtm_tag)

search_tag = %(<script src="/js/search.js" integrity="#{script_integrities.fetch('/js/search.js')}" defer></script>)
%w[default topic guide].each do |layout_name|
  layout = File.read(File.join(ROOT, '_layouts', "#{layout_name}.html"))
  abort "Search script integrity hash is incorrect in #{layout_name} layout" unless layout.include?(search_tag)
end

guide_layout = File.read(File.join(ROOT, '_layouts', 'guide.html'))
article_navigation_tag = %(<script src="/js/article-navigation.js" integrity="#{script_integrities.fetch('/js/article-navigation.js')}" defer></script>)
abort 'Article navigation script integrity hash is incorrect' unless guide_layout.include?(article_navigation_tag)

article_feedback_tag = %(<script src="/js/article-feedback.js" integrity="#{script_integrities.fetch('/js/article-feedback.js')}" defer></script>)
abort 'Article feedback script integrity hash is incorrect' unless guide_layout.include?(article_feedback_tag)

site_directory = File.join(ROOT, '_site')

if Dir.exist?(site_directory)
  html_files = Dir.glob("#{site_directory}/**/*.html")
  inline_script_pages = html_files.select do |path|
    File.read(path).match?(/<script\b(?![^>]*\bsrc\s*=)[^>]*>/i)
  end

  unless inline_script_pages.empty?
    relative_paths = inline_script_pages.map { |path| path.delete_prefix("#{site_directory}/") }
    abort "Generated pages contain inline JavaScript: #{relative_paths.join(', ')}"
  end

  html_files.each do |path|
    File.read(path).scan(/<script\b[^>]*\bsrc\s*=\s*["'][^"']+["'][^>]*>/i).each do |tag|
      source = tag[/\bsrc\s*=\s*["']([^"']+)["']/i, 1]
      expected_integrity = script_integrities[source]
      abort "Generated page uses an unexpected script source: #{source}" unless expected_integrity

      actual_integrity = tag[/\bintegrity\s*=\s*["']([^"']+)["']/i, 1]
      unless actual_integrity == expected_integrity
        abort "Generated page has an invalid integrity hash for #{source}"
      end
    end
  end

  script_integrities.each do |source, expected_integrity|
    published_script = File.join(site_directory, source.delete_prefix('/'))
    abort "Generated site is missing #{source}" unless File.exist?(published_script)
    abort "Generated site changed #{source}" unless integrity_for(published_script) == expected_integrity
  end

  published_check = File.join(site_directory, 'script', 'verify_security_headers.rb')
  abort 'The security check must not be published' if File.exist?(published_check)
end

puts 'Security headers are configured'
