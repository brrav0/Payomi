class AttachedFilesController < ApplicationController
  def index
    @attachedfiles = AttachedFile.all
  end

  def new
    @attachedfile = AttachedFile.new
  end

  def create
    @attachedfile = AttachedFile.new(attachedfile_params)

      if @attachedfile.save
        redirect_to '/bankaccounts/new', notice: "The attached file #{@attachedfile.name} has been uploaded."
      else
        render "new"
      end
  end

  def destroy
    @attachedfile = AttachedFile.find(params[:id])
    @attachedfile.destroy
    redirect_to attached_files_path, notice:  "The attached file #{@attachedfile.name} has been deleted."
  end
  
private
  def attachedfile_params
    params.require(:attached_file).permit(:name, :attachment, :signed_bank)
  end
end
