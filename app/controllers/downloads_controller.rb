class DownloadsController < ApplicationController
  def show
    respond_to do |format|
      format.pdf { send_lixotodo_pdf }

      if Rails.env.development?
        format.html { render_sample_html }
      end
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