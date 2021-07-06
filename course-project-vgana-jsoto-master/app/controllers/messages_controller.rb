class MessagesController < ApplicationController
  def index
    usuario = params["format"]
    recibidos = Message.all.where("sender_id = ? and recipient_id = ?", usuario, @user.id )
    enviados = Message.all.where("sender_id = ? and recipient_id = ?", @user.id, usuario )
    listado = []
    recibidos.each do |x|
      listado.push(x)
    end
    enviados.each do |x|
      listado.push(x)
    end
    @messages = listado
  end

  def show
  end

  def create
    puts("SSSSSSSSSSSS")
    #puts(message_params.inspect)
    
    #puts("BUSCO EMAIL")
    #message_params["recipient_id"] = User.find_by(email: message_params["recipient_id"]).id
    #puts("PILLE EMAIL")
    @message = Message.new(text: message_params["text"], status: 1, sender: current_user, recipient: User.find_by(email: message_params["recipient_id"] ))
    #puts(message_params.inspect)
    puts(@message.inspect)

    respond_to do |format|
      if @message.save!
        format.html { redirect_to messages_path(@message.recipient_id), notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: mailbox_index_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def message_params
    params.require(:message).permit(:text, :sender_id, :recipient_id, :recipient_email, :status)
  end

end
