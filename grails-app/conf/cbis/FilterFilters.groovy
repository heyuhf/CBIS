package cbis

class FilterFilters {

    def filters = {
        
        login(controller:'user',action:'index'){
            before={
                if(!session.user){
                    flash.message="请先登录"
                    redirect(controller:"user",action:"login")
                }
            }
        }
        
        
    }
}
