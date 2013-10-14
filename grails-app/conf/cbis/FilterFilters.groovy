package cbis

class FilterFilters {

    def filters = {
        
        login(controller:'user',action:'index'){
            before={
                if(!session.user){
                    flash.message="请先登录"
                    redirect(uri:"/")
                }
            }
        }
        
        
       
        
        someuri(uri:"/user/frame_*"){
            before={
                if(!session.user){
                    flash.message="请先登录"
                    redirect(controller:"main",action:"loginbox")
                }
            }
        }
        
        someuri2(uri:"/user/"){
            before={
                if(!session.user){
                    flash.message="请先登录"
                    redirect(uri:"/")
                }
            }
        }
        
    }
}
