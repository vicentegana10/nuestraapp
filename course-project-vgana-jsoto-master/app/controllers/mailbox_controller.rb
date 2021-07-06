class MailboxController < ApplicationController
  def index
    if @user != nil
      #@messages = User.find_by(id:@user.id).messages
      # @messages = Message.all.where("recipient_id = ? or sender_id = ?", @user.id, @user.id)
      receptores = Message.all.where("sender_id = ?", @user.id ).select(:recipient_id).distinct.map {|x| x.recipient_id}
      enviadores = Message.all.where("recipient_id = ?", @user.id ).select(:sender_id).distinct.map {|x| x.sender_id}
      listado = []
      receptores.each do |x|
        if x != @user.id
          listado.push(x) unless listado.include?(x)
        end
      end
      enviadores.each do |x|
        if x != @user.id
          listado.push(x) unless listado.include?(x)
        end
      end
      @mailbox = listado
    end
  end

  def show
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end



end
