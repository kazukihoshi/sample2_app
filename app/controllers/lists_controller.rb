class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    # データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # データをデータベースに保存するためのsaveメソッド実行
    if @list.save
    # 詳細画面へのリダイレクト
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end  

  def index
    @lists = List.all
  end

  def show
    # idのレコードを取得
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    # レコードを1件取得
    list = List.find(params[:id])
    # レコードを削除
    list.destroy 
    redirect_to '/lists'
  end
  
  private
  
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
