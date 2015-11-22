class AttachedFilesController < ApplicationController
  def index
    @attachedfiles = AttachedFile.all
    @attachOrigin = ""
    @confIdToRedirect = nil
  end

  def new
    @attachedfile = AttachedFile.new
    
    @attachOrigin = params[:attach_origin] # conf_new/
    @confIdToRedirect = params[:conf_id] # id for redirection
    
    puts "new @attachOrigin: " + @attachOrigin
  end

  # --- CREATE --------------------------------------------------------------
  def create
    @attachedfile = AttachedFile.new(attachedfile_params)
    @confIdToRedirect = params[:conf_id] # id for redirection
    
    # By default we consider that we are from audit
    # If we do not have conf_id we are from bank
    @attachedfile.is_audit = true
    @attachedfile.is_bank = false
    
    @attachOrigin = params[:attach_origin] # conf_new/conf_answ
    puts "create @attachOrigin: " + @attachOrigin
    
    # We assume that default is to go on confirmation new
    # i.e the auditor create a new confirmation
    redirectionAfterAttachmentOperation = '/confirmations/new'
    if @attachOrigin.eql? 'conf_asw'
    	# the bank respond with this scan
    	redirectionAfterAttachmentOperation = '/confirmations/' + @confIdToRedirect + '/check_by_bank'
    	
    	@attachedfile.is_audit = false
    	@attachedfile.is_bank = true
    end
    
    
	#Save and get back from where we are from
	if @attachedfile.save

		# We need to let the bank account to get access to this object.
		# To do so, we will serialised it and store it in the session.
		# Thus the bank account can retrieve it from the session.
		session[:last_attachedfile] = @attachedfile.to_yaml

		redirect_to redirectionAfterAttachmentOperation
	else
		render "new"
	end
  end

# --- DESTROY --------------------------------------------------------------
  def destroy
    @attachedfile = AttachedFile.find(params[:id])
    confirmationIdToGetBack = AttachedFile.find(params[:id]).confirmation_id
    puts "Delete @attachedfile: " + @attachedfile.to_s
    
	isAudit = @attachedfile.is_audit
	puts "Delete isAudit: " + isAudit.to_s


    
    # We assume that default is to go on confirmation new
    # i.e the auditor create a new confirmation
    redirectionAfterAttachmentOperation = '/confirmations/new'
    
	if !isAudit
		# Here we are not in the check by audit but by the bank
		redirectionAfterAttachmentOperation = '/confirmations/' + confirmationIdToGetBack.to_s + '/check_by_bank'
	end

	# Finally destroy the attached file here
    @attachedfile.destroy    
    
    # Specific note here. We usually redirect here but now the delete is handle by javascript
    #redirect_to redirectionAfterAttachmentOperation, status: 303
  end
  
private
  def attachedfile_params
    params.require(:attached_file).permit(:name, :attachment, :signed_bank)
  end
end
