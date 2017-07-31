class DownloadsController < ApplicationController
  layout "lixotodos_pdf"
  def show
    respond_to do |format|
      format.html
      format.pdf {send_lixotodo_pdf}
    end
  end

  def name
    respond_to do |format|
      format.html { "PDF" }
    end
  end

  private

  def lixotodo
    #Lixotodo.find(params[:id])
    Lixotodo.last
  end

  def download
    Download.new(lixotodo)
  end

  def send_lixotodo_pdf
    send_file download.to_pdf, download_attributes
  end

  def render_sample_html
    render download.render_attributes
  end

  def download_attributes
    {
        filename: download.filename,
        type: "application/pdf",
        disposition: "inline"
    }
  end
end