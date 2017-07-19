require "render_anywhere"

class Download
  include RenderAnywhere

  def initialize(lixotodo)
    @lixotodo = lixotodo
  end

  def to_pdf
    kit = PDFKit.new(as_html)
    kit.to_file("tmp/invoice.pdf")
  end

  def filename
    "Lixotodo #{lixotodo.id}.pdf"
  end

  def render_attributes
    {
        template: "lixotodos/pdf",
        layout: "lixotodos_pdf",
        locals: { lixotodo: lixotodo }
    }
  end

  private

  attr_reader :lixotodo

  def as_html
    render render_attributes
  end
end