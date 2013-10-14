import cbis.User
import cbis.Shop
import cbis.Goods
class BootStrap {

    def init = { servletContext ->
        
        def user=new User(userName:'user',password:'123456',email:'user@cbis.com',phoneNumber:'1234567')
        user.password=user.password.encodeAsPassword()
        if(user.save()){
            println 'new user saved'
        }
        
        def user1=new User(userName:'user1',password:'123456',email:'user1@cbis.com',phoneNumber:'7654321')
        user1.password=user1.password.encodeAsPassword()
        if(user1.save()){
            println 'new user1 saved'
        }
        
        def shop1=new Shop(shopName:'user-shop1',address:'user-shop1-address',user:user,description:'user-shop1-description',shopLogoUrl:'uploads/shopLogo/ssss_Logo.jpg')
        if(shop1.save()){
            println 'new shop1 saved'
        }
        
        def shop2=new Shop(shopName:'user1-shop2',address:'user1-shop2-address',user:user1,description:'user1-shop2-description',shopLogoUrl:'uploads/shopLogo/ssss_Logo.jpg')
        if(shop2.save()){
            println 'new shop2 saved'
        }
        
        def goods1=new Goods(goodsName:'user-shop1-goods1',description:'user-shop1-goods1-description',price:100,onsalePrice:0,onsale:'false',goodsPicUrls:'uploads/goodsPic/taozi.jpg',user:user,shop:shop1,unit:"个")
        if(goods1.save()){
            println 'new goods1 saved'
        }
        
        def goods2=new Goods(goodsName:'user1-shop2-goods2',description:'user1-shop2-goods2-description',price:200,onsalePrice:0,onsale:'false',goodsPicUrls:'uploads/goodsPic/pg.jpg',user:user1,shop:shop2,unit:"斤")
        if(goods2.save()){
            println 'new goods2 saved'
        }
        
    }
    def destroy = {
    }
}
