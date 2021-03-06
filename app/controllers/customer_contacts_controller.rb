class CustomerContactsController < ApplicationController
  before_action :set_customer, only: %i[create edit update]
  def create
    # @customer = Customer.find(params[:customer_id])
    @customer_contact = @customer.customer_contacts.build(customer_contact_params)
    respond_to do |format|
      if @customer_contact.save
        format.js { render :index }
      else
        format.js { render :error }
        # format.html { redirect_to customer_path(@customer), notice: '空メッセージは投稿出来ません。' }
      end
    end
  end

  def edit
    @customer_contact = @customer.customer_contacts.find(params[:id])
    redirect_to product_path(@customer) unless (current_user == @customer_contact.user) || (current_user.name == "ゲスト") || (current_user.name == "ゲスト管理者")
    respond_to do |format|
      flash.now[:notice] = 'メッセージの編集中...'
      format.js { render :edit }
    end
  end

  def update
    @customer_contact = @customer.customer_contacts.find(params[:id])
    redirect_to product_path(@customer) unless (current_user == @customer_contact.user) || (current_user.name == "ゲスト") || (current_user.name == "ゲスト管理者")
    respond_to do |format|
      if @customer_contact.update(customer_contact_params)
        flash.now[:notice] = 'メッセージが編集されました。'
        format.js { render :index }
      else
        # flash.now[:notice] = 'メッセージの編集に失敗しました。'
        format.js { render :error }
      end
    end
  end

  def destroy
    @customer_contact = CustomerContact.find(params[:id])
    redirect_to product_path(@customer) unless (current_user == @customer_contact.user) || (current_user.name == "ゲスト") || (current_user.name == "ゲスト管理者")
    @customer_contact.destroy
    respond_to do |format|
      flash.now[:notice] = 'メッセージが削除されました。'
      format.js { render :index }
    end
  end

  private

  def customer_contact_params
    params.require(:customer_contact).permit(:customer_id, :contact_message).merge(user_id: current_user.id)
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
end
