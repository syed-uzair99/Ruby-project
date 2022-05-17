class AppController < ActionController::Base
    

    def form
        me = current_user.id
        @c = User.find(me)  
        @i=ItemCategory.all
        render "layouts/form"
    end    

    def create
       @id=params[:id]
       @i=ItemList.where(itemCategory_id:@id)
       render "layouts/create"
    end 

    def new
        me = current_user.id
        @c = User.find(me)
        require 'date'
        @id=params[:id]
        @tq=params[:TotalQuantity]
        @i=ItemList.where(id:@id)
        @iii=@i.find(@id)
        @s=SaleDetail.new(SaleNo:me, CategoryID:@iii["itemCategory_id"], CategoryName:@iii["CategoryName"], ItemId:@id, ItemName:@iii["ItemName"], TotalQuantity:@tq, ItemPrice:@iii["ItemPrice"], TotalCost:@iii["ItemPrice"]*@tq.to_f, DateofSale:DateTime.now, CustomerName:@c.name, OrderID:22)
        @s.save
        render "layouts/new"
     end 

     def pur
        me=current_user.id 
        @i=SaleDetail.where(SaleNo:me)
        render "layouts/pur"
     end   

     def admin
        render "layouts/ad"
     end 

     def min
        @uu=User.all
        @u=@uu.order(name: :asc)
        @count=User.count
        @s=SaleDetail.all
        @st=StockDetail.all
        @stt=@st.order(ItemName: :asc)
        @x=SaleDetail.where(CategoryName:"Books")
        @xx=@x.order(created_at: :desc)
        @y=SaleDetail.where(CategoryName:"Furniture")
        @yy=@y.order(created_at: :desc)
        @z=SaleDetail.where(CategoryName:"Clothes")
        @zz=@z.order(created_at: :desc)
        @b=@x.sum(:TotalCost)
        @f=@y.sum(:TotalCost)
        @c=@z.sum(:TotalCost)
        for i in 1..15 do
            @d=SaleDetail.where(ItemId:i)
            sum=@d.sum(:TotalQuantity)
            @dd=StockDetail.where(ItemId:i)
            t=@dd[0]["TotalStock"]
            @dd.update(RemainingStock:t-sum, SoldStock:sum)
        end    
        n=params[:name]
        p=params[:password]
     if (n=="Coinbase" && p="coinbase")
        render "layouts/viewww"  
     else   
        render "layouts/ad"
     end   
     end

end