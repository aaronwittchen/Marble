module MarkdownHelper
  def markdown(text)
    return "" if text.blank?
    
    # Configure the HTML renderer
    renderer = Redcarpet::Render::HTML.new(
      hard_wrap: true,
      link_attributes: { target: "_blank", rel: "noopener" },
      with_toc_data: true
    )
    
    # Configure Markdown with Obsidian-like features
    markdown = Redcarpet::Markdown.new(renderer,
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true,
      superscript: true,
      highlight: true,
      footnotes: true,
      no_intra_emphasis: true,
      space_after_headers: true
    )
    
    # Render and add syntax highlighting
    html = markdown.render(text)
    syntax_highlight(html).html_safe
  end
  
  private
  
  def syntax_highlight(html)
    doc = Nokogiri::HTML.fragment(html)
    doc.css('code').each do |code|
      next unless code.parent.name == 'pre'
      
      # Try to detect language from class
      lang = code['class']&.gsub('language-', '') || 'plaintext'
      
      begin
        lexer = Rouge::Lexer.find(lang) || Rouge::Lexers::PlainText.new
        formatter = Rouge::Formatters::HTML.new
        highlighted = formatter.format(lexer.lex(code.text))
        code.inner_html = highlighted
        code['class'] = "language-#{lang}"
      rescue
        # If highlighting fails, leave code as-is
      end
    end
    doc.to_html
  end
end