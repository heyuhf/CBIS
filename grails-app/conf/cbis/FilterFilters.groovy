package cbis

class FilterFilters {

    def filters = {
        
        login(controller:'user',action:'*'){
            before={
                if(!session.user){
                    flash.message="请先登录"
                    redirect(uri:"/")
                }
            }
        }
        
        
    }
}
