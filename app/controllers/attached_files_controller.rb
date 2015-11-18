class AttachedFilesController < ApplicationController
  def index
    @attachedfiles = AttachedFile.all
  end

  def new
    @attachedfile = AttachedFile.new
    puts "@bankaccount is nil: " + @bankaccount.nil?.to_s
  end

  def create
    @attachedfile = AttachedFile.new(attachedfile_params)
    @attachedfile.is_audit = true
    @attachedfile.is_bank = false
    

      if @attachedfile.save
      	
      	# We need to let the bank account to get access to this object.
      	# To do so, we will serialised it and store it in the session.
      	# Thus the bank account can retrieve it from the session.
      	session[:last_attachedfile] = @attachedfile.to_yaml
        
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
